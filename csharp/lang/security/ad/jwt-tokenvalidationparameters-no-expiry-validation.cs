services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).AddJwtBearer(options =>
            {

                options.TokenValidationParameters = new TokenValidationParameters
                {
                    // ruleid: jwt-tokenvalidationparameters-no-expiry-validation
                    ValidateLifetime = false,
                    RequireSignedTokens = true,
                    ValidateIssuer = false,
                    ValidateAudience = false
                };
            });

services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).AddJwtBearer(options =>
            {

                options.TokenValidationParameters = new TokenValidationParameters
                {
                    // ok: jwt-tokenvalidationparameters-no-expiry-validation
                    ValidateLifetime = true,
                    RequireSignedTokens = true,
                    ValidateIssuer = false,
                    ValidateAudience = false
                };
            });

TokenValidationParameters parameters = new TokenValidationParameters();
parameters.RequireExpirationTime = false;
parameters.ValidateAudience = false;
parameters.ValidateIssuer = false;
// ruleid: jwt-tokenvalidationparameters-no-expiry-validation
parameters.ValidateLifetime = false;
// ok: jwt-tokenvalidationparameters-no-expiry-validation
parameters.ValidateLifetime = true;
