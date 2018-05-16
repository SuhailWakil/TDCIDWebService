<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="preview_dotnet_index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="accela.com">
    <title>CID</title>
    <link href="public/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="public/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="public/css/animated.css" rel="stylesheet" type="text/css" />
    <link href="public/css/vegas.min.css" rel="stylesheet" type="text/css" />
    <link href="public/css/owl.carousel.css" rel="stylesheet" type="text/css" />
    <link href="public/css/style.css" rel="stylesheet" type="text/css" />
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400italic,700italic,400,700"
        rel="stylesheet" type="text/css" />

</head>
<body class="menu-hide-page">
   <div id="form1" >
    <div id="navigation">
         <div class="navbar navbar-fixed-top" role="banner">
        <%--<div class="container">
               <div class="navbar-header"><button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><spanclass="icon-bar"></span><span class="icon-bar"></span></button><a class="navbar-brand" href="index.htm"><img class="img-responsive" src="public/img/logo.jpg" alt="logo"></a></div>
               <nav id="main-menu" class="collapse navbar-collapse navbar-right">
                  <ul class="nav navbar-nav">
                     <li class="active"><a href="#navigation">Home</a></li>
                     <li><a href="#features">Features</a></li>
                     <li><a href="#description">App Info111</a></li>
                     <li><a href="#screenshots">ScreenShots</a></li>
                     <li><a href="#video-section">Services</a></li>
                     <li><a href="#contact">contact</a></li>
                  </ul>
               </nav>
            </div>--%>
         </div>
      </div>
      <header class="home padding-150" id="header">
         <div class="container">
            <div class="row">
               <div class="col-md-8">
                  <div class="main-content text-left">
                     <h1 class="section-title">Welcome To CCD</h1>
                     <h4 class="section-sub-title">CCD Login Only</h4>
                     <!--<a href="#" class="btn btn-border"><i class="fa fa-download"></i> Download</a><a href="#" class="btn btn-border"><i class="fa fa-mail-forward"></i>Features</a>-->
                  </div>
               </div>
               <div class="col-md-4">
                <form runat="server" id="formoid" method="POST">
                  <div class="panel panel-default black">
                     <div class="panel-heading">
                        <h3 class="panel-title">Login</h3>
                     </div>
                        <div class="panel-body black">
                           <div class="row">
                              <div class="col-xs-12 col-sm-12 col-md-12">
                                  <div class="form-group">
                                      <asp:Label ID="ErrorMessage" runat="server" Text="" Visible="False" class="section-sub-title"></asp:Label>
                                 </div>
                                  <div class="form-group">
                                     <input runat="server" type="text" name="user_name" id="user_name" class="form-control input-sm floatlabel" placeholder="User Name"/>
                                 </div>
                              </div>
                           </div>
                           <div class="row">
                              <div class="col-xs-12 col-sm-12 col-md-12">
                                 <div class="form-group">
                                     <input runat="server" type="password" name="password" id="password" class="form-control input-sm" placeholder="Password" />
                                 </div>
                              </div>
                           </div>
                            <div class="row">
                              <div class="col-xs-12 col-sm-12 col-md-12">
                                 <div class="form-group">
                                      <select runat="server" class="form-control input-sm" id="language" placeholder="Language">
                                        <option value="ar">Arabic</option>
                                        <option value="en">English</option>
                                       </select>
                                 </div>
                              </div>
                           </div> 
                      </div>
                      <div class="panel-footer">
                          <asp:Button id="submitButton" class="panel-footer btn btn-border" runat="server" Text="Submit" OnClick="Submit_Click"/>
                      </div>
                  </div>
                </form>
               </div>
            </div>
         </div>

         <%--<div id="copyright-header">
            <div class="container">
               <div id="social">
                  <ul class="list">
                     <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                     <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                     <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                     <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                     <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                  </ul>
               </div>
            </div>
         </div>--%>
          
      </header>
      <%--<div id="features">
         <div class="padding-100">
            <div class="container">
               <div class="col-md-12">
                  <div class="row">
                     <h3 class="h1 col-sm-4 blue"><span class="underline">Welcome</span> to akshara</h3>
                     <div class="col-sm-8">
                        <h4 class="h2">Every website is unique but the process is always more or less as follows. aksharais the most flexible and complete theme. Its modern and fully responsive designbest fits into current web trends.</h4>
                        <ul class="horizontalLinks">
                           <li><i class="fa fa-long-arrow-right"></i><a href="#" class="arrowLink arrowRight"title="" target="_self">Learn more about us</a></li>
                           <li><i class="fa fa-long-arrow-right"></i><a href="#" class="arrowLink arrowRight" title="" target="_self">Work with us</a></li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
            <div class="text-center">
               <div class="container padding-40">
                  <div id="features-slider">
                     <div class="item">
                        <img class="img-responsive" src="public/img/features/feature1.png" alt=""/>
                        <h2>Bootstrap 3x</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporincididunt</p>
                     </div>
                     <div class="item">
                        <img class="img-responsive" src="public/img/features/feature2.png" alt=""/>
                        <h2>Responsive Design</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporincididunt</p>
                     </div>
                     <div class="item">
                        <img class="img-responsive" src="public/img/features/feature3.png" alt=""/>
                        <h2>Creative Templates</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporincididunt</p>
                     </div>
                     <div class="item">
                        <img class="img-responsive" src="public/img/features/feature2.png" alt=""/>
                        <h2>Akshara App</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporincididunt</p>
                     </div>
                     <div class="item">
                        <img class="img-responsive" src="public/img/features/feature3.png" alt=""/>
                        <h2>Cooming Soon</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporincididunt</p>
                     </div>
                     <div class="item">
                        <img class="img-responsive" src="public/img/features/feature1.png" alt=""/>
                        <h2>Video Tutorials</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporincididunt</p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div id="description">
         <div class="container">
            <div class="description-section padding-100">
               <div class="row">
                  <div class="col-md-12">
                     <div class="row">
                        <h3 class="h1 col-sm-4 blue"><span class="underline">Description</span> about app</h3>
                        <div class="col-sm-8">
                           <h4 class="h2">Every website is unique but the process is always more or less as follows. aksharais the most flexible and complete theme. Its modern and fully responsive designbest fits into current web trends.</h4>
                           <div class="horizontalLinks padding-bottom-40"><a href="#" class="btn btn-common"><i class="fa fa-long-arrow-right"></i>Learn moreabout us</a><a href="#" class="btn btn-common"><i class="fa fa-long-arrow-right"></i>Work with us</a></div>
                        </div>
                     </div>
                  </div>
                  <div class="col-sm-6">
                     <div class="descriptions">
                        <div class="description">
                           <i class="fa fa-paper-plane"></i>
                           <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporincididunt ut labore.</p>
                        </div>
                        <div class="description">
                           <i class="fa fa-life-ring"></i>
                           <p>Dolore magna aliqua. Ut enim ad minim veniam, quis nostrud. exercitation ullamcolaboris nisi ut aliquip.</p>
                        </div>
                        <div class="description">
                           <i class="fa fa-pagelines"></i>
                           <p>Commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit essecillum dolore eu fugiat nulla</p>
                        </div>
                        <div class="description">
                           <i class="fa fa-music"></i>
                           <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremquelaudantium,</p>
                        </div>
                        <div class="description">
                           <i class="fa fa-paper-plane"></i>
                           <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporincididunt ut labore.</p>
                        </div>
                     </div>
                  </div>
                  <div class="col-sm-6 text-center"><img class="img-responsive" src="public/img/mockup.png" alt=""/></div>
               </div>
            </div>
         </div>
      </div>--%>
     <%-- <section id="products">
         <div class="container-fluid">
            <div class="row">
               <a href="inner-page.html" class="col-sm-3 col-xs-6 white-bg arrow-right">
                  <div class="squared">
                     <div class="squared-content text-center">
                        <h4>Accessories</h4>
                        <h5 class="smoke">Collection '15</h5>
                     </div>
                  </div>
               </a>
               <div class="col-sm-3 col-xs-6" id="content-half-img-1">
                  <div class="squared">
                     <div class="squared-content"></div>
                  </div>
               </div>
               <a href="inner-page.html" class="col-sm-3 col-xs-6 col-xs-pushit-6 white-bg arrow-right">
                  <div class="squared">
                     <div class="squared-content text-center">
                        <h4>Prints</h4>
                        <h5 class="smoke">6 new items</h5>
                     </div>
                  </div>
               </a>
               <div class="col-sm-3 col-xs-6 col-xs-pullit-6" id="content-half-img-2">
                  <div class="squared">
                     <div class="squared-content"></div>
                  </div>
               </div>
               <div class="col-sm-3 col-xs-6 col-xs-pushit-6" id="content-half-img-3">
                  <div class="squared">
                     <div class="squared-content"></div>
                  </div>
               </div>
               <a href="inner-page.html" class="col-sm-3 col-xs-6 col-xs-pullit-6 white-bg arrow-left">
                  <div class="squared">
                     <div class="squared-content text-center">
                        <h4>Packaging</h4>
                        <h5 class="smoke">Free!</h5>
                     </div>
                  </div>
               </a>
               <div class="col-sm-3 col-xs-6" id="content-half-img-4">
                  <div class="squared">
                     <div class="squared-content"></div>
                  </div>
               </div>
               <a href="inner-page.html" class="col-sm-3 col-xs-6 white-bg arrow-left">
                  <div class="squared">
                     <div class="squared-content text-center">
                        <h4>Clothing</h4>
                        <h5 class="smoke">Spring '15</h5>
                     </div>
                  </div>
               </a>
            </div>
         </div>
      </section>
      <div id="screenshots">
         <div class="overlay-bg"></div>
         <div class="container">
            <div class="padding-100">
               <div class="row">
                  <h3 class="h1 col-sm-4 blue"><span class="underline">Screenshots</span></h3>
                  <div class="col-sm-8">
                     <h4 class="h2">Every website is unique but the process is always more or less as follows. aksharais the most flexible and complete theme. Its modern and fully responsive designbest fits into current web trends.</h4>
                     <a href="#" class="btn btn-common"><i class="fa fa-long-arrow-right"></i>Learn moreabout us</a><a href="#" class="btn btn-common"><i class="fa fa-long-arrow-right"></i>Work with us</a>
                  </div>
               </div>
               <div id="screenshot-slider" class="padding-50">
                  <div class="item"><img class="img-responsive" src="public/img/screenshots/screen1.png" alt=""/></div>
                  <div class="item"><img class="img-responsive" src="public/img/screenshots/screen2.png" alt=""/></div>
                  <div class="item"><img class="img-responsive" src="public/img/screenshots/screen3.png" alt=""/></div>
                  <div class="item"><img class="img-responsive" src="public/img/screenshots/screen4.png" alt=""/></div>
                  <div class="item"><img class="img-responsive" src="public/img/screenshots/screen1.png" alt=""/></div>
                  <div class="item"><img class="img-responsive" src="public/img/screenshots/screen2.png" alt=""/></div>
                  <div class="item"><img class="img-responsive" src="public/img/screenshots/screen3.png" alt=""/></div>
                  <div class="item"><img class="img-responsive" src="public/img/screenshots/screen4.png" alt=""/></div>
                  <div class="item"><img class="img-responsive" src="public/img/screenshots/screen1.png" alt=""/></div>
                  <div class="item"><img class="img-responsive" src="public/img/screenshots/screen2.png" alt=""/></div>
                  <div class="item"><img class="img-responsive" src="public/img/screenshots/screen3.png" alt=""/></div>
                  <div class="item"><img class="img-responsive" src="public/img/screenshots/screen4.png" alt=""/></div>
               </div>
            </div>
         </div>
      </div>
      <section id="pricing" class="section pricing white-bg padding-100">
         <div class="container">
            <div class="row">
               <h3 class="h1 col-sm-4 blue"><span class="underline">Price</span> list</h3>
               <div class="col-sm-8">
                  <h4 class="h2"> Every website is unique but the process is always more or less as follows. akshara is the most flexible and complete theme. Its modern and fully responsive design best fits into current web trends.</h4>
                  <a href="#" class="btn btn-border"><i class="fa fa-long-arrow-right"></i>Learn more about us</a><a href="#" class="btn btn-border"><i class="fa fa-long-arrow-right"></i> Work with us</a>
               </div>
            </div>
            <div class="row">
               <div class="padding-50">
                  <div class="col-sm-4">
                     <div class="price-box">
                        <h5>Basic</h5>
                        <div class="price-info">
                           <div class="price"><span><i>$</i>25</span>/mo</div>
                           <ul>
                              <li>Up to 5 pages</li>
                              <li>1 year hosting</li>
                              <li>3 months support</li>
                              <li class="disabled">SEO</li>
                              <li class="disabled">Secrity &amp; Backup</li>
                              <li class="disabled">24/7 Support</li>
                           </ul>
                        </div>
                        <a href=# class="btn btn-black">Get Started</a>
                     </div>
                  </div>
                  <div class="col-sm-4">
                     <div class="price-box featured">
                        <h5>Standard</h5>
                        <div class="price-info">
                           <div class="price"><span><i>$</i>75</span>/mo</div>
                           <ul>
                              <li>Up to 5 pages</li>
                              <li>1 year hosting</li>
                              <li>3 months support</li>
                              <li>SEO</li>
                              <li class="disabled">Secrity &amp; Backup</li>
                              <li class="disabled">24/7 Support</li>
                           </ul>
                        </div>
                        <a href=# class="btn btn-common">Get Started</a>
                     </div>
                  </div>
                  <div class="col-sm-4">
                     <div class="price-box">
                        <h5>Premium</h5>
                        <div class="price-info">
                           <div class="price"><span><i>$</i>125</span>/mo</div>
                           <ul>
                              <li>Up to 5 pages</li>
                              <li>1 year hosting</li>
                              <li>3 months support</li>
                              <li>SEO</li>
                              <li>Secrity &amp; Backup</li>
                              <li>24/7 Support</li>
                           </ul>
                        </div>
                        <a href=# class="btn btn-black">Get Started</a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <section id="small_intro" class="call-to-action main-bg">
         <div class="container">
            <div class="row">
               <div class="col-md-8 wow slideInLeft animated text-center">
                  <p class="light-text"> Like What You See? We're Just Getting Started</p>
               </div>
               <div class="col-md-4 wow slideInRight animated text-center"><a href="#" class="btn btn-borderwhite">View Portfolio</a></div>
            </div>
         </div>
      </section>
      <div id="reviews" class="white-bg padding-100">
         <div class="container">
            <div class="padding">
               <div class="row section-title text-center">
                  <div class="col-sm-8 col-sm-offset-2">
                     <h1><i class="fa fa-thumbs-o-up"></i>Reviews</h1>
                     <p>Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Praesent sapienmassa, convallis a pellentesque negestas</p>
                     <div class="review-count">
                        <h1>4.0</h1>
                        <ul class="list-inline">
                           <li><i class="fa fa-star"></i></li>
                           <li><i class="fa fa-star"></i></li>
                           <li><i class="fa fa-star"></i></li>
                           <li><i class="fa fa-star-half-o"></i></li>
                           <li><i class="fa fa-star-o"></i></li>
                        </ul>
                        <p>3,156</p>
                     </div>
                  </div>
               </div>
               <div id="review-slider">
                  <div class="item">
                     <div class="review-person"><img class="img-responsive" src="public/img/reviews/review1.jpg" alt=""/></div>
                     <div class="review">
                        <h3>Cathie Scanlon</h3>
                        <div class="review-stars"><span><i class="fa fa-star"></i></span><span><i class="fa fa-star"></i></span><span><i class="fa fa-star"></i></span><span><i class="fa fa-star"></i></span><span><iclass="fa fa-star"></i></span></div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporincididunt</p>
                     </div>
                  </div>
                  <div class="item">
                     <div class="review-person"><img class="img-responsive" src="public/img/reviews/review2.jpg" alt=""/></div>
                     <div class="review">
                        <h3>Marry Staclin</h3>
                        <div class="review-stars"><span><i class="fa fa-star"></i></span><span><i class="fa fa-star"></i></span><span><i class="fa fa-star"></i></span><span><i class="fa fa-star"></i></span><span><iclass="fa fa-star"></i></span></div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporincididunt</p>
                     </div>
                  </div>
                  <div class="item">
                     <div class="review-person"><img class="img-responsive" src="public/img/reviews/review1.jpg" alt=""/></div>
                     <div class="review">
                        <h3>Cathie Scanlon</h3>
                        <div class="review-stars"><span><i class="fa fa-star"></i></span><span><i class="fa fa-star"></i></span><span><i class="fa fa-star"></i></span><span><i class="fa fa-star"></i></span><span><iclass="fa fa-star"></i></span></div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporincididunt</p>
                     </div>
                  </div>
                  <div class="item">
                     <div class="review-person"><img class="img-responsive" src="public/img/reviews/review2.jpg" alt=""/></div>
                     <div class="review">
                        <h3>Cathie Scanlon</h3>
                        <div class="review-stars"><span><i class="fa fa-star"></i></span><span><i class="fa fa-star"></i></span><span><i class="fa fa-star"></i></span><span><i class="fa fa-star"></i></span><span><iclass="fa fa-star"></i></span></div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporincididunt</p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <section id="about" class="smoke-bg padding-50">
         <div class="container">
            <div class="row divide-md counter-section">
               <div class="col-sm-3 col-xs-6 divide-md">
                  <div class="counter" id="counter-1"></div>
                  <h4>Sections</h4>
               </div>
               <div class="col-sm-3 col-xs-6 divide-md">
                  <div class="counter" id="counter-2"></div>
                  <h4>Demos</h4>
               </div>
               <div class="col-sm-3 col-xs-6 divide-md">
                  <div class="counter" id="counter-3"></div>
                  <h4>Framework</h4>
               </div>
               <div class="col-sm-3 col-xs-6 divide-md">
                  <div class="counter" id="counter-4"></div>
                  <h4>Love</h4>
               </div>
            </div>
         </div>
      </section>
      <section id="contact" class="white-bg">
         <div class="container padding-100">
            <div class="row">
               <div class="section-header wow zoomIn animated" data-wow-offset="10" data-wow-delay="0.5s">
                  <h3 class="h1 blue"><span class="underline">Get</span> In-Touch</h3>
               </div>
            </div>
            <div class="row padding-top-40">
               <div class="col-md-8">
                  <div id="main-contact-form" class="contact-form">
                     <form role="form" action="contact.php" method="post">
                        <div class="form-group"><label class="sr-only" for="contact-name"> Name</label><input type="text" name="name" placeholder="Name..." class="contact-name form-control" id="contact-name"></div>
                        <div class="form-group"><label class="sr-only" for="contact-email"> Email</label><input type="text" name="email" placeholder="Email..." class="contact-email form-control" id="contact-email"></div>
                        <div class="form-group"><label class="sr-only" for="contact-subject"> Subject</label><input type="text" name="subject" placeholder="Subject..." class="contact-subject form-control" id="contact-subject"></div>
                        <div class="form-group"><label class="sr-only" for="contact-message"> Message</label><textarea name="message" placeholder="Message..." class="contact-message form-control" id="contact-message"></textarea></div>
                        <button type="submit" class="btn btn-common"> Send message</button>
                     </form>
                  </div>
               </div>
               <div class="col-md-4">
                  <h4 class="column-title"><span>Information</span></h4>
                  <p> Akshara is simply dummy text of the printing and typesetting industry. Akshara is simply dummy text of the printing and typesetting industry. Akshara is simply dummy text of the printing and typesetting industry. </p>
                  <p> Akshara is simply dummy text of the printing and typesetting industry. </p>
                  <div style="margin-bottom: 10px;"></div>
                  <div style="margin-bottom: 30px;"></div>
                  <h4 class="column-title"><span>Working Hours</span></h4>
                  <ul class="list-unstyled">
                     <li><strong>Monday - Friday</strong> - 9am to 5pm</li>
                     <li><strong>Saturday</strong> - 9am to 2pm</li>
                     <li><strong>Sunday</strong> - Closed</li>
                  </ul>
               </div>
            </div>
         </div>
      </section>--%>
      <footer>
         <div class="container">
         <%--   <div class="row footer-widgets">
               <div class="col-md-3 col-xs-12">
                  <div class="footer-widget mail-subscribe-widget social-widget wow zoomIn animated" data-wow-offset="10" data-wow-delay="0.5s">
                     <h4> Follow Us<span class="head-line"></span></h4>
                     <ul class="social-icons">
                        <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a class="google" href="#"><i class="fa fa-google-plus"></i></a></li>
                        <li><a class="dribbble" href="#"><i class="fa fa-dribbble"></i></a></li>
                        <li><a class="linkdin" href="#"><i class="fa fa-linkedin"></i></a></li>
                        <li><a class="flickr" href="#"><i class="fa fa-flickr"></i></a></li>
                        <li><a class="tumblr" href="#"><i class="fa fa-tumblr"></i></a></li>
                        <li><a class="instgram" href="#"><i class="fa fa-instagram"></i></a></li>
                        <li><a class="vimeo" href="#"><i class="fa fa-vimeo-square"></i></a></li>
                        <li><a class="skype" href="#"><i class="fa fa-skype"></i></a></li>
                     </ul>
                  </div>
               </div>
               <div class="col-md-3 col-xs-12">
                  <div class="footer-widget twitter-widget wow zoomIn animated" data-wow-offset="10" data-wow-delay="0.5s">
                     <h4> Twitter Feed<span class="head-line"></span></h4>
                     <ul>
                        <li>
                           <p><a href="#">@akshara </a>Bootstrap Templates et, Admin Templates.</p>
                           <span>28 February 2015</span>
                        </li>
                        <li>
                           <p><a href="#">@akshara </a>Bootstrap Templates et, Admin Templates.</p>
                           <span>28 February 2015</span>
                        </li>
                     </ul>
                  </div>
               </div>
               <div class="col-md-3 col-xs-12">
                  <div class="footer-widget flickr-widget wow zoomIn animated" data-wow-offset="10" data-wow-delay="0.5s">
                     <h4> Themes Feed<span class="head-line"></span></h4>
                     <ul>
                        <li><a href="#">Admin & Dashboard </a></li>
                        <li><a href="#">Full Websites </a></li>
                        <li><a href="#">Landing Pages </a></li>
                        <li><a href="#">One Page Websites </a></li>
                        <li><a href="#">Portfolio </a></li>
                        <li><a href="#">Blogs </a></li>
                     </ul>
                  </div>
               </div>
               <div class="col-md-3 col-xs-12">
                  <div class="footer-widget contact-widget wow zoomIn animated" data-wow-offset="10" data-wow-delay="0.5s">
                     <h4> AKSHARA<span class="head-line"></span></h4>
                     <p> So it's a good idea to make sure that you have the each topic very clearly before moving on to the next chapter or section.</p>
                     <ul>
                        <li><span>Phone Number:</span> +01 234 567 890</li>
                        <li><span>Email:</span> company@company.com</li>
                        <li><span>Website:</span> www.aspxtemplates.com</li>
                     </ul>
                  </div>
               </div>
            </div>--%>
            <div class="copyright-section wow zoomIn animated" data-wow-offset="10" data-wow-delay="0.5s">
               <div class="row">
                  <div class="col-md-6 col-sm-12 col-xs-12">
                     <p> &copy; 2018 CCD - All Rights Reserved <a href="#">CCD</a></p>
                  </div>
                  <%--<div class="col-md-6 col-sm-12 col-xs-12">
                     <ul class="footer-nav">
                        <li><a href="#">Sitemap</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Contact</a></li>
                     </ul>
                  </div>--%>
               </div>
            </div>
         </div>
      </footer>
      <div class="scroll-top" data-spy="affix" data-offset-top="300"><a href="#header"><i class="fa fa-angle-up"></i></a></div>
      <script src="public/js/jquery.js" type="text/javascript"></script><script src="public/assets/js/bootstrap.min.js" type="text/javascript"></script><script src="js/jquery.backstretch.js" type="text/javascript"></script><script src="js/nav.js" type="text/javascript"></script><script src="js/vegas.min.js" type="text/javascript"></script><script src="js/owl.carousel.min.js" type="text/javascript"></script><script src="js/waypoints.min.js" type="text/javascript"></script><script src="js/counter.min.js" type="text/javascript"></script><script src="js/scroll-top.js" type="text/javascript"></script><script src="js/wow.min.js" type="text/javascript"></script><script src="js/main.js" type="text/javascript"></script>
    </div>

</body>
</html>
