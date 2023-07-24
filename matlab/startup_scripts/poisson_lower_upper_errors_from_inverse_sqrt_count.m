%%% Function to get Poisson lower and upper vertical error bar lengths from 1/sqrt(n), where n is the number of counts.
function [lower, upper] = poisson_lower_upper_errors_from_inverse_sqrt_count(inverse_sqrt_count, confidence_level)
	assert(all(inverse_sqrt_count >= 0));

	if nargin < 2
		sigma = 0.682689492137086;
		confidence_level = sigma;
	end
	assert(confidence_level >= 0 & confidence_level <= 1);

	count = round(1./inverse_sqrt_count.^2); % get integer count n from estimated error (1/sqrt(n))
	count(inverse_sqrt_count == 0 | inverse_sqrt_count == Inf) = 0; % whether estimated error due to n = 0 counts (1/sqrt(0)) is interpreted as 0 or Inf, make sure count n = 0
	[lower, upper] = poisson_lower_upper_errors_from_count(count, confidence_level);
end
