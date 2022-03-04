
// test code from https://pumascan.com/rules/#sec0122-jwt-signature-validation-disabled
class Foo{  
    services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
  .AddJwtBearer(options =>
  {
      options.TokenValidationParameters = new TokenValidationParameters
      {
          // ruleid:jwt-signature-validation-disabled 
          RequireSignedTokens = false,
      };
  });


    services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
  .AddJwtBearer(options =>
  {
      options.TokenValidationParameters = new TokenValidationParameters
      {
          // ok:jwt-signature-validation-disabled 
          RequireSignedTokens = true,
      };
  });

}
            