function save_for_publication(fig, fig_name, format)
	if nargin < 3
		format = 'pdf';
	end

	options = {'-loose'; '-painters'};
	if strcmp(format, 'pdf') == true
		options = [options; '-r0']; % -painters needed for hi-res
	elseif strcmp(format, 'png') == true
		options = [options; '-r600'];
	end

	format = ['-d', format];
	print(fig_name, format, options{:});
end
