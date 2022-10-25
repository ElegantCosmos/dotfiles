%%% Function to get lower and upper vertical error bar lengths from number of counts n.
function [lower, upper] = get_lower_upper_errors_from_count(count, confidence_level)
	assert(all(count >= 0));
	assert(confidence_level >= 0 & confidence_level <= 1);

	alpha = 0.5*(1 - confidence_level);
	lower = abs(count - 0.5*chi2inv(alpha, 2*count)); % length(s) of lower vertical uncertainty bars
	upper = abs(0.5*chi2inv(1 - alpha, 2*(count + 1)) - count); % length(s) of upper vertical uncertainty bars
end
