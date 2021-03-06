JGQD.plot=function(x,thin=1,burns,h=FALSE,palette='mono')
{
  if(class(x)=='JGQD.mcmc')
  {
    par.matrix=t(x$par.matrix)
    prop.matrix=t(x$prop.matrix)
    theta=par.matrix[,1]
    acc=x$acceptance.rate

    tt=1:length(acc)

    tt = seq(1,dim(x$par.matrix)[1],thin)

    #windows()

    nper=length(theta)
    #print(nper)
    if(nper==1){par(mfrow=c(1,2));d1=1;d2=1;}
    if(nper==2){par(mfrow=c(2,2));d1=1;d2=2;}
    if(nper==3){par(mfrow=c(2,2));d1=2;d2=2;}
    if(nper>3)
    {
      d1=1:((nper)+1)
      d2=d1
      O=outer(d1,d2)
      #print(O)
      test=O-((nper)+1)
      #print(test)
      test[test<0]=100
      test=test[1:max(4,ceiling(sqrt(nper+1))),1:max(4,ceiling(sqrt(nper+1)))]
      test
      wh=which(test==min(test))
      # print(test)
      d1=d1[col(test)[wh[1]]]
      d2=d2[row(test)[wh[1]]]
      par(mfrow=c(d1,d2))
    }
    # print(c(d1,d2))
     if(palette=='mono')
    {
     cols =rep('#222299',nper)
    }else{
     cols=rainbow_hcl(nper, start = 10, end = 275,c=100,l=70)
    }
    ylabs=paste0('theta[',1:nper,']')
    for(i in 1:nper)
    {
      if(h)
      {
        hist(par.matrix[i,tt],col=cols[i],main=ylabs[i],freq=F)
      }else
      {
        plot(prop.matrix[i,tt]~tt,col='gray90',type='s',main=ylabs[i],xlab='Iteration',ylab='')
        lines(par.matrix[i,tt]~tt,col=cols[i],type='s')
        if(!missing(burns)){abline(v=burns,lty='dotdash')}
      }
    }
    plot(acc,type='l',ylim=c(0,1),col='darkblue',main='Accept. Rate',xlab='Iteration',ylab='%/100')
    abline(h=seq(0,1,1/10),lty='dotted')
    abline(h=0.4,lty='solid',col='red',lwd=1.2)
    abline(h=0.2,lty='solid',col='red',lwd=1.2)
    if(!missing(burns)){abline(v=burns,lty='dotdash')}
    box()

    decode.prob=x$decode.prob
    decode=FALSE
    if(sum(decode.prob)!=0){decode = TRUE}
    if(decode)
    {
      plot(decode.prob,type='h',col='steelblue',main='Jump detection prob.',xlab='Transition',ylab='Prob.',ylim=c(0,1))
      abline(h=seq(0,1,1/10),lty='dotted',col='gray75')
      lines(decode.prob,type='h',col='steelblue')
    }
  }

  if(class(x)=='JGQD.mle')
  {
    stop('Nothing to plot!')
  }

  if(class(x)=='JGQD.density')
  {
    if(requireNamespace('rgl', quietly = TRUE))
    {
      open3d(windowRect=c(50,50,640+50,50+640),zoom=0.95)
      persp3d(x=x$Xt,y=x$time,z=x$density,col='white',box=FALSE,xlab='State (X_t)',ylab='Time (t)',zlab='Density f(X_t|X_s)')
      # play3d(spin3d(axis=c(0,0,1), rpm=3), duration=10)
    }else
    {

      persp(x=x$Xt,y=x$time,z=x$density,col='white',xlab='State (X_t)',ylab='Time (t)',zlab='Density f(X_t|X_s)',border=NA,shade=0.5,theta=145)
    }
  }


  if(class(x)=='BiJGQD.density')
  {
    colpal=function(n){rev(sequential_hcl(n,power=0.8,l=c(40,100)))}
    for(i in 1:dim(x$density)[3])
    {
      # Now illustrate the density:
      filled.contour(x$Xt,x$Yt,x$density[,,i],
                     main=paste0('Transition Density \n (t = ',x$time[i],')'),
                     color.palette=colpal
                     ,xlab='Xt',ylab='Yt')
    }
  }
}
