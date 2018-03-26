void SaveOpen(const std::string file = "plot.pdf", int nFiles = 1) // Draw and copy quickly with one function.
{
  assert(!file.empty()); // filename must not be empty
  if (gPad == NULL) {
	  std::cerr << "No gPad object found for plot." << std::endl;
	  return;
  }

  std::string file_pdf = file; // save plot as PDF
  if (file_pdf.find(".pdf") == std::string::npos) {
    file_pdf += ".pdf";
  }
  gPad->SaveAs(file_pdf.c_str());

  std::string file_C = file; // save plot as script
  if (file_C.find(".pdf") != std::string::npos) {
    size_t found = file_C.find(".pdf");
    file_C = file_C.substr(0, file_C.length() - std::string(".pdf").length());
    file_C += ".C";
  } else {
    file_C += ".C";
  }
  gPad->SaveAs(file_C.c_str());

  std::string file_ROOT = file; // save plot in ROOT file
  if (file_ROOT.find(".pdf") != std::string::npos) {
    size_t found = file_ROOT.find(".pdf");
    file_ROOT = file_ROOT.substr(0, file_ROOT.length() - std::string(".pdf").length());
    file_ROOT += ".root";
  } else {
    file_ROOT += ".root";
  }
  gPad->SaveAs(file_ROOT.c_str());


  assert(nFiles > 0);
  if (nFiles == 1) {
    gSystem->Exec("openlatest");
  } else {
    TString cmd;
    cmd.Form("openlatest %i", nFiles);
    gSystem->Exec(cmd.Data());
  }

  return;
}
