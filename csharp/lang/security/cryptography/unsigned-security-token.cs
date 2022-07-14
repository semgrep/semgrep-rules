services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).AddJwtBearer(options =>
            {

                options.TokenValidationParameters = new TokenValidationParameters
                {
                    RequireSignedTokens = false,
                    ValidateIssuer = false,
                    ValidateAudience = false
                };
            });