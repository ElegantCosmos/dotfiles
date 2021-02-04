void SetLogY(const bool flag = true) // Set linear y-axis scale, and other aesthetic settings
{
  gPad->SetLogy(int(!flag));
  gPad->Modified();
  gPad->Update();
}
