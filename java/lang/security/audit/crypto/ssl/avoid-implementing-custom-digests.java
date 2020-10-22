// ruleid: avoid-implementing-custom-digests
public class MyProprietaryMessageDigest extends MessageDigest {

    @Override
    protected byte[] engineDigest() {
        return "";
    }
}

// ok: avoid-implementing-custom-digests
public class NotMessageDigest {
    public NotMessageDigest() {
        System.out.println("");
    }
}
