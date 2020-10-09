const baba = "baba"
// ruleid:no-replaceall
const str1 = old_str1.replaceAll(baba, "    ");
// ok:no-replaceall
const str1 = old_str1.replaceAll(hello, "    ");
// ruleid:no-replaceall
const str2 = old_str2.replaceAll("\t", "    ")
// ok:no-replaceall
const str3 = old_str3.replace("\t", "    ");
