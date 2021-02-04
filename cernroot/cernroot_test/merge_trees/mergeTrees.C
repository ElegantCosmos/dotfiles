{
  int var;

  TTree* t0 = new TTree("t0", "t0");
  t0->Branch("var", &var, "var/I");
  var = 0;
  t0->Fill();

  TTree* t1 = new TTree("t1", "t1");
  t1->Branch("var", &var, "var/I");
  var = 1;
  t1->Fill();

  std::cout << "t0->GetEntries()" << t0->GetEntries() << ";" << std::endl;
  std::cout << "t1->GetEntries()" << t1->GetEntries() << ";" << std::endl;


  TList* list = new TList;
  list->Add(t1);
  t0->Merge(list);
  delete list;

  std::cout << "t0->GetEntries()" << t0->GetEntries() << ";" << std::endl;
  std::cout << "t1->GetEntries()" << t1->GetEntries() << ";" << std::endl;

  delete t1;
}
