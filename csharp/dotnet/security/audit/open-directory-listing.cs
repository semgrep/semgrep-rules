
public void Configure(IApplicationBuilder app, IHostingEnvironment env)
{
    var builder = WebApplication.CreateBuilder(args);
    // ruleid: open-directory-listing
    builder.Services.AddDirectoryBrowser();

    var fileProvider = new PhysicalFileProvider(Path.Combine(builder.Environment.WebRootPath, "data"));
    var requestPath = "/data";

    // ruleid: open-directory-listing
    app.UseDirectoryBrowser(new DirectoryBrowserOptions
    {
        FileProvider = fileProvider,
        RequestPath = requestPath
    });
}


public void Configure(IApplicationBuilder app, IHostingEnvironment env)
{
    var builder = WebApplication.CreateBuilder(args);
    // ok : open-directory-listing
    builder.Services.AddRazorPages();

    // ok : open-directory-listing
    app.UseHttpsRedirection();
}
