// ruleid: never-return-pointers
int* one();
// ruleid: never-return-pointers
long* two(int* a);
// ruleid: never-return-pointers
[[no_discard]] long* three(long* a);
// ruleid: never-return-pointers
[[no_discard]] const long* four(long* a);

// ruleid: never-return-pointers 
int* one() { return nullptr; }
// ruleid: never-return-pointers
long* two(int* a) { return a; }
// ruleid: never-return-pointers
[[no_discard]] long* three(long* a) { return a; }
// ruleid: never-return-pointers
[[no_discard]] const long* four(long* a) { return a; }
// ruleid: never-return-pointers
[[no_discard]] auto* five(long* a) { return a; }

using SpecialFloat = const float;
// ruleid: never-return-pointers
SpecialFloat* theortically_ok();

// Aliases that have the pointer in the typename are likely to have their own ownership sematics
//  Despite remaining problomatic, this is better than before
using OwningSpecialFloat = const float*;
OwningSpecialFloat better();

// ok: never-return-pointers
int okay1();
// ok: never-return-pointers
long okay2();
// ok: never-return-pointers
float okay3();