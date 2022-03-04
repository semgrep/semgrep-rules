// test code from https://pumascan.com/rules/#sec0121-cors-any-origin-wildcard
using Microsoft.AspNetCore.Builder;

class Foo{  
    public void Configure(IApplicationBuilder app, IHostingEnvironment env)
    {
        // ruleid:cors-allow-origin-wildcard 
        app.UseCors(builder => builder.AllowAnyOrigin());
    }

    private readonly string secureOrigin = "_secureOrigin";

    public void ConfigureServices(IServiceCollection services)
    {
        // ok:cors-allow-origin-wildcard 
        services.AddCors(options =>
        {
            options.AddPolicy(MyAllowSpecificOrigins,
            builder =>
            {
                builder.WithOrigins("https://www.pumasecurity.io",
                                    "https://www.pumascan.com");
            });
        });
    }

    public void Configure(IApplicationBuilder app, IHostingEnvironment env)
    {
        app.UseCors(secureOrigin);
    }

}
            