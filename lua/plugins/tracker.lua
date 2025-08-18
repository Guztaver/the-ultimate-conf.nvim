return {
	'gaborvecsei/usage-tracker.nvim',
	opts = {
		keep_eventlog_days = 30,
		cleanup_freq_days = 14,
		event_wait_period_in_sec = 5,
		inactivity_threshold_in_min = 5,
		inactivity_check_freq_in_sec = 5,
		verbose = 0,
		telemetry_endpoint = "http://anjosbook:8999" -- you'll need to start the restapi for this feature
	}
}
