public void Configure(IApplicationBuilder app, IHostingEnvironment env)
{
    if (env.IsDevelopment())
    {
        // ruleid: missing-hsts-header
        app.UseDeveloperExceptionPage();
    }
    else
    {
        // ruleid: missing-hsts-header
        app.UseExceptionHandler("/Error");
    }
    // ruleid: missing-hsts-header
    app.UseHttpsRedirection();
    // ruleid: missing-hsts-header
    app.UseStaticFiles();
    // ruleid: missing-hsts-header
    app.UseRouting();
    // ruleid: missing-hsts-header
    app.UseAuthentication();
    // ruleid: missing-hsts-header
    app.UseAuthorization();
    // ruleid: missing-hsts-header
    app.UseSession();
    // ruleid: missing-hsts-header
    app.UseEndpoints(endpoints =>
    {
        endpoints.MapRazorPages();
    });

}


public void Configure(IApplicationBuilder app, IHostingEnvironment env)
{

    if (env.IsDevelopment())
    {
        app.UseDeveloperExceptionPage();
    }
    else
    {
        app.UseExceptionHandler("/Error");
        // ok: missing-hsts-header
        app.UseHsts();
    }

    app.UseHttpsRedirection();
    app.UseStaticFiles();

    app.UseRouting();

    app.UseAuthentication();
    app.UseAuthorization();

    app.UseSession();

    app.UseEndpoints(endpoints =>
    {
        endpoints.MapRazorPages();
    });

}

public void ConfigureServices(IServiceCollection services)
{
    // ruleid: missing-hsts-header
    services.AddControllers();

 }

public void ConfigureServices(IServiceCollection services)
{

    services.AddControllers();
    // ok: missing-hsts-header
    services.AddHsts(options =>
    {
        options.Preload = true;
        options.IncludeSubDomains = true;
        options.MaxAge = TimeSpan.FromDays(365);
    });
}
