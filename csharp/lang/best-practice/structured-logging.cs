using Microsoft.Extensions.Logging;
using Serilog;
using NLog;

class Program
{
    public static void SerilogSample()
    {
        using var serilog = new LoggerConfiguration().WriteTo.Console().CreateLogger();

        var position = new { Latitude = 25, Longitude = 134 };
        var elapsedMs = 34;

        // ok: structured-logging
        serilog.Information("Processed {@Position} in {Elapsed:000} ms.", position, elapsedMs);

        // ruleid: structured-logging
        serilog.Information($"Processed {position} in {elapsedMs:000} ms.");
    }

    public static void MicrosoftSample()
    {
        var loggerFactory = LoggerFactory.Create(builder => {
                builder.AddConsole();
            }
        );

        var logger = loggerFactory.CreateLogger<Program>();

        var position = new { Latitude = 25, Longitude = 134 };
        var elapsedMs = 34;

        // ok: structured-logging
        logger.LogInformation("Processed {@Position} in {Elapsed:000} ms.", position, elapsedMs);

        // ruleid: structured-logging
        logger.LogInformation($"Processed {position} in {elapsedMs:000} ms.");
    }

    public static void NLogSample()
    {
        var logger = NLog.LogManager.Setup().LoadConfiguration(builder => {
            builder.ForLogger().WriteToConsole();
        }).GetCurrentClassLogger();

        var position = new { Latitude = 25, Longitude = 134 };
        var elapsedMs = 34;

        // ok: structured-logging
        logger.Info("Processed {@Position} in {Elapsed:000} ms.", position, elapsedMs);

        // ruleid: structured-logging
        logger.Info($"Processed {position} in {elapsedMs:000} ms.");

        // try with different name
        var _LOG = logger;

        // ruleid: structured-logging
        _LOG.Info($"Processed {position} in {elapsedMs:000} ms.");
    }

    public static void NotLogging()
    {
        // System.Web.TraceContext.Warn does not support structured logging
        var traceContext = new FakeTraceContext();

        // ok: structured-logging
        traceContext.Warn($"hello world");
    }

    public static void Main()
    {
        SerilogSample();
        MicrosoftSample();
        NLogSample();
        NotLogging();
    }
}

class FakeTraceContext
{
    public void Warn(string foo) { }
}
