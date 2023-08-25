%%% Function to get Poisson lower and upper vertical error bar lengths from number of counts n.
function [lower, upper] = poisson_lower_upper_errors_from_counts(counts, confidence_level)
	assert(all(counts >= 0)); % non-negativity sanity check
	%assert(all(counts == floor(counts))); % integer sanity check

	if nargin < 2
		sigma = 0.682689492137086;
		confidence_level = sigma;
	end
	assert(confidence_level >= 0 & confidence_level <= 1);

	alpha = 0.5*(1 - confidence_level);
	lower = abs(counts - 0.5*chi2inv(alpha, 2*counts)); % magnitude(s) of lower uncertainty
	upper = abs(0.5*chi2inv(1 - alpha, 2*(counts + 1)) - counts); % magnitude(s) of upper uncertainty
end
