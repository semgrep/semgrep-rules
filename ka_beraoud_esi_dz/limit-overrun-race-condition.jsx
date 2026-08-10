const express = require('express');
const { db } = require('../utils/db');
const UserRepo = require('../repositories/userRepo');

const app = express();
app.use(express.json());

app.post('/api/purchase', async (req, res) => {
    const { userId, itemCost } = req.body;
    
    // ruleid: limit-overrun-race-condition
    const user = await db.user.findUnique({ where: { id: userId } });
    
    if (user.balance >= itemCost) {
        await db.user.update({
            where: { id: userId },
            data: { balance: user.balance - itemCost }
        });
        return res.json({ success: true });
    }
    return res.status(400).json({ success: false, reason: 'Insufficient balance' });
});

app.post('/api/use-credits', async (req, res) => {
    const { userId, cost } = req.body;

    // ruleid: limit-overrun-race-condition
    const account = await db.account.findOne({ id: userId });
    
    if (account.credits < cost) {
        return res.status(400).json({ success: false, reason: 'Insufficient credits' });
    }
    
    await db.account.updateOne(
        { id: userId },
        { $set: { credits: account.credits - cost } }
    );
    return res.json({ success: true });
});

app.post('/api/redeem-reward', async (req, res) => {
    const { userId, rewardCost } = req.body;

    // ruleid: limit-overrun-race-condition
    const user = await UserRepo.findById(userId);
    
    if (user.points >= rewardCost) {
        user.points -= rewardCost;
        await user.save();
        return res.json({ success: true });
    }
    return res.status(400).json({ success: false, reason: 'Not enough points' });
});

app.post('/api/transfer', async (req, res) => {
    const { userId, amount } = req.body;

    // ruleid: limit-overrun-race-condition
    const user = await db.user.findById(userId);
    const { balance } = user;
    
    if (balance > amount) {
        await db.user.update({
            where: { id: userId },
            data: { balance: balance - amount }
        });
        return res.json({ success: true });
    }
    return res.status(400).json({ success: false, reason: 'Insufficient funds' });
});

app.post('/api/check-status', async (req, res) => {
    const { userId } = req.body;

    // ok: limit-overrun-race-condition
    const user = await db.user.findUnique({ where: { id: userId } });
    
    if (user.balance >= 1000) {
        await db.user.update({
            where: { id: userId },
            data: { isVIP: true } // Different field mutated
        });
    }
    res.json({ success: true });
});

app.post('/api/purchase-atomic', async (req, res) => {
    const { userId, itemCost } = req.body;

    // ok: limit-overrun-race-condition
    const result = await db.user.updateOne(
        { id: userId, balance: { $gte: itemCost } },
        { $inc: { balance: -itemCost } } // Atomic deduction
    );
    
    if (result.modifiedCount > 0) {
        return res.json({ success: true });
    }
    return res.status(400).json({ success: false, reason: 'Insufficient balance' });
});

app.post('/api/activate-user', async (req, res) => {
    const { userId } = req.body;

    // ok: limit-overrun-race-condition
    const user = await UserRepo.findById(userId);
    
    if (user.points > 0) {
        user.status = 'active'; // Different field mutated
        await user.save();
    }
    res.json({ success: true });
});

const PORT = process.env.PORT || 3000;
if (require.main === module) {
    app.listen(PORT, () => {
        console.log(`Server listening on port ${PORT}`);
    });
}

module.exports = app;
