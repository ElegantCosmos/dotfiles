void SaveOpen(const char* file = "test.pdf", int nFiles = 1) // Draw and copy quickly with one function.
{
  assert(strcmp(file, "") != 0); // filename must not be empty
  gPad->SaveAs(file);

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
