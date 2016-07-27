void savecp(const char* file = "", int nFiles = 1) // Draw and copy quickly with one function.
{
  if (strcmp(file, "") == 0) { // if empty
    file = "test.pdf";
  }
  assert(strcmp(file, "") != 0); // filename must not be empty
  gPad->SaveAs(file);

  assert(nFiles > 0);
  if (nFiles == 1) {
    gSystem->Exec("scplatest");
  } else {
    TString cmd;
    cmd.Form("scplatest %i", nFiles);
    gSystem->Exec(cmd.Data());
  }

  return;
}
