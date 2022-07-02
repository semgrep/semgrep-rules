public void Configure(IApplicationBuilder app, IWebHostEnvironment env)  
{  
        if (!env.IsDevelopment())  
        {  
            app.UseDeveloperExceptionPage();  
        }  
    else  
        {  
            app.UseExceptionHandler("/Error");  
        }  

}
