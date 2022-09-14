services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).AddJwtBearer(options =>
            {

                options.TokenValidationParameters = new TokenValidationParameters
                {
                    // ruleid: unsigned-security-token
                    RequireSignedTokens = false,
                    ValidateIssuer = false,
                    ValidateAudience = false
                };
            });

services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).AddJwtBearer(options =>
            {
                options.TokenValidationParameters = new TokenValidationParameters
                {
                    // ok: unsigned-security-token
                    RequireSignedTokens = true,
                    ValidateIssuer = false,
                    ValidateAudience = false
                };
            });
