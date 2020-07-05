using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using meally_api.Data;
using meally_api.Data.Interfaces;
using meally_api.Services;
using meally_api.Services.Interfaces;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.ResponseCompression;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.OpenApi.Models;

namespace meally_api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddScoped<IRestaurantService, RestaurantService>();
            services.AddScoped<IOrderService, OrderService>();
            services.AddScoped<IUserService, UserService>();
            services.AddScoped<IQueueService, QueueService>();

            services.AddSingleton<IRestaurantDAO, RestaurantDAO>();
            services.AddSingleton<IOrderDAO, OrderDAO>();
            services.AddSingleton<IUserDAO, UserDAO>();
            services.AddSingleton<IQueueDAO, QueueDAO>();

            services.AddCors();
            services.AddControllers().AddJsonOptions(options =>
            {
                options.JsonSerializerOptions.DictionaryKeyPolicy = null;
                options.JsonSerializerOptions.IgnoreNullValues = true;
            });

            services.AddResponseCompression(options =>
            {
                options.Providers.Add<GzipCompressionProvider>();
                options.MimeTypes = ResponseCompressionDefaults.MimeTypes.Concat(new[] { "application/json" });
            });

            services.AddSwaggerGen(s =>
            {
                s.SwaggerDoc("v1", new OpenApiInfo
                {
                    Version = "v1",
                    Title = "Mega Hack 3.0 API",
                    Description = "Mega Hack 3.0 API - v1",
                });

                s.CustomSchemaIds(i => i.Name);
                s.IgnoreObsoleteActions();
                s.IgnoreObsoleteProperties();

                //var securitySchema = new OpenApiSecurityScheme
                //{
                //    Description = "JWT Authorization header using the Bearer scheme. Example: \"Authorization: Bearer {token}\"",
                //    Name = "Authorization",
                //    In = ParameterLocation.Header,
                //    Type = SecuritySchemeType.Http,
                //    Scheme = "bearer",
                //    Reference = new OpenApiReference
                //    {
                //        Type = ReferenceType.SecurityScheme,
                //        Id = "Bearer"
                //    }
                //};

                //s.AddSecurityDefinition("Bearer", securitySchema);

                //var securityRequirement = new OpenApiSecurityRequirement();
                //securityRequirement.Add(securitySchema, new[] { "Bearer" });
                //s.AddSecurityRequirement(securityRequirement);

            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseSwagger();
            app.UseSwaggerUI(s =>
            {
                s.SwaggerEndpoint("/swagger/v1/swagger.json", "Mega Hack 3.0 API - v1");
                s.RoutePrefix = string.Empty;
            });

            app.UseRouting();

            // global cors policy
            app.UseCors(x => x
                .AllowAnyOrigin()
                .AllowAnyMethod()
                .AllowAnyHeader());

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
