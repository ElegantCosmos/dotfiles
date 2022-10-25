%%% Function to get lower and upper vertical error bar lengths from 1/sqrt(n), where n is the number of counts.
function [lower, upper] = get_lower_upper_errors_from_inverse_sqrt_count(inverse_sqrt_count, confidence_level)
	assert(all(inverse_sqrt_count >= 0));
	assert(confidence_level >= 0 & confidence_level <= 1);

	count = round(1./inverse_sqrt_count.^2); % get integer count n from estimated error (1/sqrt(n))
	count(inverse_sqrt_count == 0 | inverse_sqrt_count == Inf) = 0; % whether estimated error due to n = 0 counts (1/sqrt(0)) is interpreted as 0 or Inf, make sure count n = 0
	[lower, upper] = get_upper_lower_errors_from_count(count, confidence_level);
end
