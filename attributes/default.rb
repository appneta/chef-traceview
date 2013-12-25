#
# Apache instrumentation
#

# Tracelyzer collector settings for /etc/tracelyzer/collector.conf
default['traceview']['tracelyzer']['collector_port'] = 2222
default['traceview']['tracelyzer']['collector_host'] = "s2f0.incoming.tracelytics.com"

# Cookbook and template to use for /etc/apache2/mods-available/oboe.conf
default['traceview']['apache']['cookbook'] = "traceview"
default['traceview']['apache']['template'] = "etc/apache2/mods-available/oboe.conf.erb"

# Apache layer application name; if not set, this host's Apache layer will not
# be registered as an entry point for an existing TraceView app.
#
# WARNING: do not assign the same appname as other layers
default['traceview']['apache']['appname'] = nil

# OboeTracingMode When traces should be initiated for incoming requests. Valid
# options are "always", "through" (when the request is initiated with a tracing
# header from upstream) and "never".
# You must set this directive to "always" in order to initiate tracing.
default['traceview']['apache']['tracing_mode'] = 'always'

# OboeSamplingRate This value reflects the number of requests out of every million
# that will be traced, and must be an integer between 0 and 1000000.
# Default is 300000 (30%).
default['traceview']['apache']['sampling_rate'] = 300000

#
# PHP instrumentation
#

# Apache layer application name; if not set, this host's PHP layer will not
# be registered as an entry point for an existing TraceView app.
#
# WARNING: do not assign the same appname as other layers
default['traceview']['php']['appname'] = nil

# Determines when incoming requests are to be traced. Valid options are "always"
# (initiate new traces according to the sample_rate below), "through" (add to
# traces that are initiated higher up the call chain) and "never".
# Default is "through".
default['traceview']['php']['tracing'] = 'through'

# When oboe.tracing is set to always, this value determines the number of
# requests out of every million that will be traced, and must be an integer
# between 0 and 1000000.
# Default is 300000 (ie. 30%).
default['traceview']['php']['sample_rate'] = 300000

# Enable or disable sanitizing SQL query traces. The following values are accepted:
# 0 - disable SQL sanitizing (default),
# 1 - enable SQL sanitizing and attempt to automatically determine which quoting form is used,
# 2 - enable SQL sanitizing and drop double quoted characters, or
# 4 - enable SQL sanitizing and retain double quoted characters.
default['traceview']['php']['enable_sanitize_sql'] = 0

# Some applications use PHP's error_log() function as an easy way to log
# debugging and other messages. By setting this value to 0, you will prevent
# error_log messages from showing up on our Errors page, improving the
# signal-to-noise ratio. Other, non-error_log PHP errors (such as undefined
# variables, syntax errors, etc) will still be captured.
# Default is 1 (ie. enabled).
default['traceview']['php']['enable_wrap_error_log'] = 1
