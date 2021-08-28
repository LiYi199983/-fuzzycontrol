b=newfis('fuzz_smc2');

b=addvar(b,'input','s2',[-1,1]);
b=addmf(b,'input',1,'NE','trapmf',[-1,-1,-0.2,0]);
b=addmf(b,'input',1,'ZE','trimf',[-0.2,0,0.2]);
b=addmf(b,'input',1,'PO','trapmf',[0,0.2,1,1]);

b=addvar(b,'output','Mu2',[0,1]);

b=addmf(b,'output',1,'ZE','trimf',[0,0.00001,2]);
b=addmf(b,'output',1,'PO','trapmf',[0,1,1,1]);

rulelist=[1 2 1 1;
          2 1 1 1;
          3 2 1 1];

b=addrule(b,rulelist);
showrule(b)                        


b1=setfis(b,'DefuzzMethod','lom');  
writefis(b1,'fsmc2');              
b2=readfis('fsmc2');
ruleview(b2);

figure(1);
plotmf(b,'input',1);
xlabel('{\its}', 'Interpreter', 'tex')
figure(2);
plotmf(b,'output',1);
xlabel('{\it\epsilon}', 'Interpreter', 'tex')