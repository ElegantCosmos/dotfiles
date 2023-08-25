%%% Function to get Poisson lower and upper vertical error bar lengths from 1/sqrt(n), where n is the number of counts.
function [lower, upper] = poisson_lower_upper_errors_from_inverse_sqrt_counts(inverse_sqrt_counts, confidence_level)
	assert(all(inverse_sqrt_counts >= 0));

	if nargin < 2
		sigma = 0.682689492137086;
		confidence_level = sigma;
	end
	assert(confidence_level >= 0 & confidence_level <= 1);

	counts = round(1./inverse_sqrt_counts.^2); % get integer counts n from estimated error (1/sqrt(n))
	counts(inverse_sqrt_counts == 0 | inverse_sqrt_counts == Inf) = 0; % whether estimated error due to n = 0 counts (1/sqrt(0)) is interpreted as 0 or Inf, make sure n = 0
	%assert(all(counts == floor(counts))); % integer sanity check

	[lower, upper] = poisson_lower_upper_errors_from_counts(counts, confidence_level);
end
