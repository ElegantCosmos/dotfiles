void SaveOpen(const std::string file = "plot.pdf", int nFiles = 1) // Draw and copy quickly with one function.
{
  assert(!file.empty()); // filename must not be empty
  if (gPad == NULL) {
	  std::cerr << "No gPad object found for plot." << std::endl;
	  return;
  }
  std::string file_pdf = file;
  if (file_pdf.find(".pdf") == std::string::npos) {
    file_pdf += ".pdf";
  }
  gPad->SaveAs(file_pdf.c_str());

  std::string file_C = file;
  if (file_C.find(".pdf") != std::string::npos) {
    size_t found = file_C.find(".pdf");
    file_C = file_C.substr(0, file_C.length() - std::string(".pdf").length());
    file_C += ".C";
  } else {
    file_C += ".C";
  }
  gPad->SaveAs(file_C.c_str());


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
