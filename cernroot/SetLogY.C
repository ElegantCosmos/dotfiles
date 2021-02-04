void SetLogY(const bool flag = true) // Set logarithmic y-axis scale, and other aesthetic settings
{
  gPad->SetLogy(int(flag));
  gPad->Modified();
  gPad->Update();
}

