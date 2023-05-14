%%% Function to get Poisson lower and upper vertical error bar lengths from 1/sqrt(n), where n is the number of counts.
function [lower, upper] = poisson_lower_upper_errors_from_inverse_sqrt_counts(inverse_sqrt_counts, confidence_level)
	assert(confidence_level >= 0 & confidence_level <= 1);
	assert(all(inverse_sqrt_counts >= 0) & all(inverse_sqrt_counts <= 1));

	counts = round(1./inverse_sqrt_counts.^2); % get integer count n from estimated error (1/sqrt(n))
	counts(inverse_sqrt_counts == 0 | inverse_sqrt_counts == Inf) = 0; % if estimated error (1/sqrt(n)) is interpreted as 0 or Inf, make sure count n = 0

	[lower, upper] = poisson_lower_upper_errors_from_counts(counts, confidence_level);
end
