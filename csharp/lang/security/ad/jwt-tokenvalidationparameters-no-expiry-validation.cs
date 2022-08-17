services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).AddJwtBearer(options =>
            {

                options.TokenValidationParameters = new TokenValidationParameters
                {
                    // ruleid: jwt-tokenvalidationparameters-no-expiry-validation
                    ValidateLifetime = false,
                    RequireSignedTokens = true,
                    ValidateIssuer = false,
                    ValidateAudience = false,
                    // ruleid: jwt-tokenvalidationparameters-no-expiry-validation
                    RequireExpirationTime = false
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
                    ValidateAudience = false,
                    // ok: jwt-tokenvalidationparameters-no-expiry-validation
                    RequireExpirationTime = true
                };
            });

TokenValidationParameters parameters = new TokenValidationParameters();
// ruleid: jwt-tokenvalidationparameters-no-expiry-validation
parameters.RequireExpirationTime = false;
parameters.ValidateAudience = false;
parameters.ValidateIssuer = false;
// ruleid: jwt-tokenvalidationparameters-no-expiry-validation
parameters.ValidateLifetime = false;
// ok: jwt-tokenvalidationparameters-no-expiry-validation
parameters.ValidateLifetime = true;
// ok: jwt-tokenvalidationparameters-no-expiry-validation
parameters.RequireExpirationTime = true;
