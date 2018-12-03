%Compute the critical value for the FHC statistic, it uses bisection method
%to find the solution
%Arguments:
%N:Number of (tests') p-values
%alpha: significance level
%accurate: The acceptable error for the critical value
%Return:
%critical: the critical value of FHC statistic
%prob: The p-value associated with the critical value
function [critical,prob]=gridSearch(N,alpha,accurate)
lower=0;
upper=1;
%check condition
p1=computePvalue(N,lower);
p2=computePvalue(N,upper);
if(p1<alpha&&p2>alpha)
    while(upper-lower>accurate)
        error=upper-lower;
        temp=(lower+upper)/2;
        prob=computePvalue(N,temp);
        if(prob<alpha)
            lower=temp;
        else
            if(prob>alpha)
                upper=temp;
            else
                break;
            end
        end
    end
%     p1=computePvalue(lower,beta);
%     p2=computePvalue(upper,beta);
    p1=alpha;
    p2=alpha;
    if(p1>alpha||p2<alpha)
        'Warning:result may not be accurate,lower or upper bound is not valid'
        critical=-(lower+upper)/2;
        %prob=method2(hc_result,N);
        prob=alpha;
    else
        critical=(lower+upper)/2;
        %prob=method2(hc_result,N);
        prob=alpha;
    end
else
    'invalid upper or lower bound'
    prob=0;
    critical=0;
end



