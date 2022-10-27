clear all;

names = ["part_1"; "part_2a"; "part_2b"; "part_3a"; "part_3b"];
masses_g = [100; 150; 134; 40; 21];
peakdoserates_gamma_MeVPerGPerS = [1e6; 1.2e4; 1.8e4; 4.5e5; 4.4e6];
peakdoserate_gamma_errfracs = [0.05; 0.2; 0.12; 0.02; 0.5];
peakdoserates_xray_MeVPerGPerS = [1.3e5; 1.2e4; 2.0e3; 3.8e4; 8.0e5];
peakdoserate_xray_errfracs = [0.04; 0.1; 0.06; 0.05; 0.6];

table_doserates = table(names, masses_g, ...
    peakdoserates_gamma_MeVPerGPerS, peakdoserate_gamma_errfracs, ...
    peakdoserates_xray_MeVPerGPerS, peakdoserate_xray_errfracs);
table_doserates;

part_names_to_plot = ["part1" "part2" "part3"];
part_names_to_extract = {["part_1"]; ["part_2a" "part_2b"]; ["part_3a" "part_3b"]};
peakdoserates_gamma_MeVPerGPerS_out = NaN(1, size(part_names_to_extract, 1));
peakdoserate_gamma_errfracs_out = NaN(1, size(part_names_to_extract, 1));
peakdoserates_xray_MeVPerGPerS_out = NaN(1, size(part_names_to_extract, 1));
peakdoserate_xray_errfracs_out = NaN(1, size(part_names_to_extract, 1));
total_masses_g_out = NaN(1, size(part_names_to_extract, 1));


for i_part = 1:size(part_names_to_extract, 1)
    mass_g_tot = 0;
    edeprate_gamma_MeVPerS_tot = 0;
    edeprate_xray_MeVPerS_tot = 0;
    err_gamma_tot = 0;
    err_xray_tot = 0;
    
    part_names = part_names_to_extract{i_part};
    for j_part = 1:size(part_names, 2)
        part_name = part_names{j_part};
        select = strcmp(table_doserates.names, part_name);
        
        mass_g = table_doserates.masses_g(select);
        mass_g_tot = mass_g_tot + mass_g;
        
        edeprate_gamma = mass_g*table_doserates.peakdoserates_gamma_MeVPerGPerS(select);
        edeprate_gamma_MeVPerS_tot = edeprate_gamma_MeVPerS_tot + edeprate_gamma;
        
        edeprate_xray = mass_g*table_doserates.peakdoserates_xray_MeVPerGPerS(select);
        edeprate_xray_MeVPerS_tot = edeprate_xray_MeVPerS_tot + edeprate_xray;
       
        edeprate_gamma_err = table_doserates.peakdoserate_gamma_errfracs(select)*edeprate_gamma;
        edeprate_xray_err = table_doserates.peakdoserate_xray_errfracs(select)*edeprate_xray;
        err_gamma_tot = edeprate_gamma_err^2;
        err_xray_tot = edeprate_xray_err^2;
    end
    
    peakdoserate_gamma_MeVPerGPerS_out = edeprate_gamma_MeVPerS_tot/mass_g_tot;
    peakdoserates_gamma_MeVPerGPerS_out(i_part) = peakdoserate_gamma_MeVPerGPerS_out;
    peakdoserates_gamma_errfracs_out(i_part) = sqrt(err_gamma_tot)/mass_g_tot/peakdoserate_gamma_MeVPerGPerS_out;
    
    peakdoserate_xray_MeVPerGPerS_out = edeprate_xray_MeVPerS_tot/mass_g_tot;
    peakdoserates_xray_MeVPerGPerS_out(i_part) = peakdoserate_xray_MeVPerGPerS_out;
    peakdoserates_xray_errfracs_out(i_part) = sqrt(err_xray_tot)/mass_g_tot/peakdoserate_xray_MeVPerGPerS_out;
    
    total_masses_g_out(i_part) = mass_g_tot;
end

xs = part_names_to_plot
ys_gamma = peakdoserates_gamma_MeVPerGPerS_out
yfracerrs_gamma = peakdoserates_gamma_errfracs_out
ys_xray = peakdoserates_xray_MeVPerGPerS_out
yfracerrs_xray = peakdoserates_xray_errfracs_out

save("plot_data.mat", "xs", "ys_gamma", "yfracerrs_gamma", "ys_xray", "yfracerrs_xray");