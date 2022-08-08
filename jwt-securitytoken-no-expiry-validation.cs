services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).AddJwtBearer(options =>
            {

                options.TokenValidationParameters = new TokenValidationParameters
                {
                    // ruleid: jwt-securitytoken-no-expiry-validation
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
                    // ok: jwt-securitytoken-no-expiry-validation
                    ValidateLifetime = true,
                    RequireSignedTokens = true,
                    ValidateIssuer = false,
                    ValidateAudience = false
                };
            });