import { DomSanitizer, SecurityContext } from '@angular/platform-browser'

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

        // ok:angular-sanitize-none-context
        let sanitized = this.sanitizer.sanitize(SecurityContext.HTML, value);
        // ruleid:angular-sanitize-none-context
        let unsanitized = this.sanitizer.sanitize(SecurityContext.NONE, value);
    }
}
