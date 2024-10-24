public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
{
        if (!env.IsDevelopment())
        {
            // ruleid: stacktrace-disclosure
            app.UseDeveloperExceptionPage();
        }
    else
        {
            app.UseExceptionHandler("/Error");
        }

}

public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
{
        if (env.IsDevelopment())
        {
            // ok: stacktrace-disclosure
            app.UseDeveloperExceptionPage();
        }
    else
        {
            app.UseExceptionHandler("/Error");
        }
}

public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
{
        if (env.IsDevelopment())
            // ok: stacktrace-disclosure
            app.UseDeveloperExceptionPage();
}
