import { DomSanitizer, SecurityContext } from '@angular/platform-browser'
import DOMPurify from 'dompurify'

class SomeClass {
    constructor(private sanitizer: DomSanitizer){}

    bypass(value: string){
        // ruleid:angular-bypasssecuritytrust
        let html = this.sanitizer.bypassSecurityTrustHtml(value);
        // ruleid:angular-bypasssecuritytrust
        let style = this.sanitizer.bypassSecurityTrustStyle(value);
        // ruleid:angular-bypasssecuritytrust
        let script = this.sanitizer.bypassSecurityTrustScript(value);
        // ruleid:angular-bypasssecuritytrust
        let resource_url = this.sanitizer.bypassSecurityTrustResourceUrl(value);
        // ruleid:angular-bypasssecuritytrust
        let url = this.sanitizer.bypassSecurityTrustUrl(value);


        // ok:angular-bypasssecuritytrust
        let url1 = this.sanitizer.bypassSecurityTrustUrl("a");
        // ok:angular-bypasssecuritytrust
        let html1 = this.sanitizer.bypassSecurityTrustHtml("value");
        // ok:angular-bypasssecuritytrust
        let html2 = this.sanitizer.bypassSecurityTrustHtml(DOMPurify.sanitize("value"))
    }
}
