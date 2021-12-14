// ruleid:useless-ternary
card.id.includes(":") ? `/r/${card.id}` : `/r/${card.id}`

// ok
card.id.includes(":") ? `/s/${card.id}` : `/r/${card.id}`
