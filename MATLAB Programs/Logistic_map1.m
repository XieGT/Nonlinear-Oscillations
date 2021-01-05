r_values=(0:1e-4:4)';
iterations_per_value=100;
y=zeros(length(r_values),iterations_per_value);
y0=0.5;
y(:,1)=r_values.*y0*(1-y0);
for i=1:iterations_per_value-1;
    y(:,i+1)=r_values.*y(:,i).*(1-y(:,i));
end
plot(r_values,y(:,50:100),'.','MarkerSize',1);
grid on
