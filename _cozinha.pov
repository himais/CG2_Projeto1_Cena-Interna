/*
________________________________________________________

       PROJETO 1 - B1CG2
       Cena Interna: Cozinha
       
       Nome: Ma�ra Satiko Tabata
       Prontu�rio: 1561545 
________________________________________________________
*/

/*
________________________________________________________

                     Includes
________________________________________________________
*/

//Bibliotecas  
#include "colors.inc"
#include "textures.inc"          
#include "stones.inc"  
#include "woods.inc"
#include "glass.inc"
#include "metals.inc"
  

//Objetos
#include "armarios.pov"  
#include "fogao.pov"
#include "liquidificador.pov"    
#include "janela1.pov" 
#include "janela2.pov"    
#include "pia.pov" 
#include "microwave.inc"
#include "gas.pov" 
#include "pinguim.pov" 
#include "ima.pov" 
#include "table.inc"  
#include "chair.pov"
#include "cacto.pov" 
#include "garrafa.pov"
#include "jarra.pov"
#include "leite.pov" 
#include "mug.pov"
#include "plants1.inc" 
#include "plant_pot.inc"
#include "cerealbowl.pov"  
#include "cortina.pov"



//Framework 
#include "Textures.inc" 
#include "HardwareTextures.inc"
#include "Cabinets.inc"
#include "Appliances.inc"
#include "Fixtures.inc"                  


/*
________________________________________________________

                Configura��es b�sicas
________________________________________________________
*/

//C�mera                     
camera {
     location <-7.5, 7, -10.4>  
     look_at <6, 4, 0>  
   
   /* 
   1: (principal)  
     location <-7.5, 7, -10.4>  
     look_at <6, 4, 0>   
   2:  
     location <-9, 7, -10>  
     look_at <8, 4, 0>
   3:
     location <8, 7, -10>  
     look_at <-2, 4, 0>   
   4:     
     location <3, 7, -10.4>  
     look_at <3, 4, 0>  
     
     */
}  
 
 plane { y, 0.1 pigment{DarkGreen} }
 
//Fundo

// sky ------------------------------------
sphere{<0,0,0>,1 hollow
 texture{
  pigment{gradient <0,1,0>
          color_map{
           [0.0 color White]
           [0.8 color rgb<0.1,0.25,0.75>]
           [1.0 color rgb<0.1,0.25,0.75>] }
         } // end pigment
  finish {ambient 1 diffuse 0}
  } // end of texture
 scale 10000
 } // end of sphere -----------------------

//Luz que simula o sol     
light_source{<500,500,-1000> color White }  

//Luz interna
light_source {  <-1,8,-4>, color White }
  
/*
________________________________________________________

           Declara��es de objetos da cena
________________________________________________________
*/ 


//Parede
#declare parede = 
box {
        <0, 0, 1>,< 15, 10, 1>	
	translate <0, 0, 0>
} 


//Buraco da pia 
#local sinkShape =
intersection {
    superellipsoid { <0.3, 0.3> }
    plane { y, 0 }
    scale < 18 * INCH / 2, 12 * INCH, 15 * INCH / 2 >
    rotate -45 * y
}   

#local sinkPunch =
object { sinkShape scale < 1, 3, 1 > translate 12 * INCH * 1.5 * y } 

//Geladeira e gabinete 
#declare geladeira = 
    union {
            object {
                BookshelfUnit(
                        39 * INCH,
                        70 * INCH,
                        24 * INCH,
                        0,
                        0,
                        texture { CherryTexture rotate 90 * z })
        }
        object {
                Refrigerator(
                        36 * INCH, 69 * INCH, 30 * INCH,
                        GlossyBlackTexture,
                        BrushedNickelTexture,
                        BrushedNickelTexture)
                translate -(30 * INCH - 24 * INCH + 1 * INCH) * z
        }
        rotate 90 * y
        translate < 0 - 24 * INCH, 0, 39 * INCH / 2 + 0 >     
        scale 0.1 
        rotate y*270     
    }

//Fog�o     
#declare fogao2 =   
    object {
        Stove(
                30 * INCH, 35 * INCH + 1 * INCH, 24 * INCH + 1 * INCH,
                BrushedNickelTexture,
                GlossyBlackTexture,
                BrushedNickelTexture)
        rotate -90 * y
        translate < 24 * INCH + 1 * INCH + 0, 0, 30 * INCH / 2 + 0 >
    }

#declare forno = 
box { 
        <0, 0.3, 1>,< 2.5, 2, 2>  
	texture {  GlossyBlackTexture } 
	translate <0, 0, 0> 	
	finish {           
           ambient 0.2    
           diffuse 0.2    
           specular 0.5
     }   
     rotate y*90 translate <5.65, 0.8, -2.55> 
     }
     
//M�rmore dos balc�es  
#declare marmore =    
box{
        <0, 0, 1>,< 10, 0.05, 2>  
        pigment{White} 
        rotate y*180
        scale z*2.5
        translate <6.5, 3.57, 5>   }
        
        
//Pote
#declare Pot =
union{

//Lid
cone{<0,0,0>,1-1/16,<0,.5,0>, .125 translate<0,1.25,0>}
sphere{<0,0,0>, 1/4 scale<1,.75,1> translate<0,1.25+.5+.1,0>}
     
//Body
torus{1,1/16 translate<0,1.25,0> }
cone{<0,1.25-.00312110105899,0>,1+.0624220211799,<0,-.00312110105899,0>,1-1/16}
torus{1-1/16-1/16,1/16}

translate<0,1/16,0>
pigment{rgb<.8,.6,.4>}
finish{specular .7 roughness .05 reflection .6}
}
         

#declare moldura =          
object {
    FancyTrimSection(
        -36  * INCH,
         36  * INCH,
          4  * INCH,
         5/8 * INCH)
    texture {
        pigment { color rgb < 1.0, 0.95, 0.8 > }
        finish { ambient AMBIENT diffuse DIFFUSE }
    }      
    scale 0.1
    translate <0,9.6,2.5>
}
 
/*
________________________________________________________

                Constru��o da cena
________________________________________________________
*/
union{       
                      
        //Geladeira             
        object{geladeira translate <-1, 0, 2.5>}  //object{geladeira rotate y * 90 translate <9.1, 0, -5.9>}  
        
        
        //Arm�rios do ch�o 
        //object{armarioBottomGaveta scale 0.1 translate x*-9.5}                 
        
        object{armarioBottomGavetaMini scale 0.1 translate x*-0.1}  
        
        union {
                //Buraco da pia --> difference no arm�rio e m�rmore
                difference{         
                        union{
                                object{armarioBottom scale 0.1 translate x*0.8}          
                                object{marmore translate x*1.45}   
                                object{marmore translate x*2.5}                 
                        }                                
                        object{sinkPunch scale 0.1 rotate y*45  translate <0.8,4,1> }                      
                
                }
                
                //Pia         
                object{pia scale 0.1 translate <-1, 0, -27> rotate y*45  translate <-2.14,0.115,0>}
                
                translate x*1.2  
        }
        
        object{armarioBottomGavetaMini scale 0.1 translate x*4.2}
        
        object{armarioCantoDireito scale 0.1 translate <5.1, 0.01, -1.6>}  
        
        object{armarioBottomMini rotate y*90 scale 0.1 translate <6.8, 0.02, -2.3>}
        
        object{armarioBottomGavetaMini scale 0.1 rotate y*90 translate <6.8, 0.02, -6>}  
        
        
        //Microondas 
        object{microwave scale 0.5 rotate y*225 translate <7,3.5,0>}  
        
        
        //Fog�o 
        object{fogao2 scale 0.1 rotate y*180 translate <9.2, 0.1, -2.3>}  
        
        object{fogao translate <34122.367188, -3031.653747, -30008.156733> translate y*1710  translate z*-2500 scale 0.1 scale 0.1 scale 0.35 rotate y*90 translate <7.8, 0.9,-5.4> } 
        
        object{forno}  
        
        
        //Arm�rios da parede
        //object{armarioTopMini2 scale 0.1 translate <5, 6.2, 1>}            
        
        object{armarioCantoDireitoTop scale 0.1 scale -1  rotate y*180  translate <5.4, 9, -0.8>}  
        
        object{armarioTopMini2 scale 0.1 rotate y*90 translate <7.2, 6.2, -1.3>} 
        
        object{armarioTopMini scale 0.1 rotate y*90 translate <7.2, 7.8, -3.7>} 
        
        object{armarioTopMini2 scale 0.1 rotate y*90 translate <7.2, 6.2, -6>} 
        
        //object{armarioTopMini scale 0.1 scale <1.3, 1.3, 1.3> rotate y * 90 translate <7, 7.4, -4.1>} 
        
        
        //Liquidificador                                                 
        object{liquidificador scale 0.1 scale 0.5 translate <7.8, 3.65, -1.8>} 
        
        
        //Botij�o de g�s
        object{gas texture {BrushedNickelTexture} scale 0.3 rotate -y*120 translate <8,0.3,-8>} 
        
        
        //Teto          
        union{
                object{parede rotate x*90 scale x*1.5 translate <-13, 11, -6>}
                object{parede rotate x*90 scale x*1.5 translate <-13, 11, -12.5>}                  	
                texture { pigment{ color rgb< 1, 0.90, 0.85>  } 
                         //normal { bumps 0.5 scale 0.00000001 }
                           finish { diffuse 0.9 phong 1 reflection 0.00}
                        }   
        }
        
        //Ch�o
        union{
                object{parede rotate x*90 scale x*1.5 translate <-13, 11, -6>texture { pigment { image_map {"chao.jpg"} rotate x*90}
                         //normal { bumps 0.5 scale 0.00000001 }
                           finish { diffuse 0.9 phong 1 reflection 0.00}
                        } }
                object{parede rotate x*90 scale x*1.5 translate <-13, 11, -12.5>texture { pigment { image_map {"chao.jpg"} rotate x*90}
                         //normal { bumps 0.5 scale 0.00000001 }
                           finish { diffuse 0.9 phong 1 reflection 0.00}
                        } }
                translate y*-9.99
                finish { diffuse 0.9 phong 1 reflection 0.00}
        }     
        
        //Parede da esquerda
        //object{parede rotate y*90 translate <-10,0,2.5>}  
        union{
                object{parede rotate y*90 translate <8,0,2.5> pigment{White} }
                object{moldura rotate y*90 translate x*6.5} 
                object{moldura rotate y*90 translate x*6.5 translate z*-6.5}   
                object{moldura rotate y*90 translate x*6.5 translate z*-9} 
                rotate y*180
                translate <-3,0,-7>
        }
        
        
        //Janela do fundo
        object{Window_3 (0.5, 0.5) scale 4 scale x*1.4 translate <2.2,1.1,2.5> pigment{ color rgb<1,1,1>*1.2 } finish { phong 0.1}}   
        
        
        //Parede do fundo
        difference{                
                union{  
                        object{parede scale x*1.6 translate <-13.5, 0, 1.5>	
                        texture { pigment { image_map {"tile.jpg"} }	
                                 //normal { bumps 0.5 scale 0.00000001 }
                                   finish { diffuse 0.9 phong 1 reflection 0.00}
                                } }                   
                        //Molduras         
                        object{moldura }
                        object{moldura translate x*6} 
                        object{moldura translate x*-6}  
                        object{moldura translate x*-9} 
                        
                } 
                box {
                        <0, 0, 1>,< 5.5, 3.8, 3>
                        translate <0, 0, 0>
                        finish {
                        ambient 0.2
                        diffuse 0.2 
                        specular 0.5
                        } 
                        translate <-0.5,4.4,0> 
                }  
        }
                                     
        //Janela da direita
        object{Window_2 (1) scale 4 scale x*0.5 rotate y*90 translate <9, 1.1 ,-8.5> pigment{ color rgb<1,1,1>*1.2 } finish { phong 0.1}}   
        
        
        //Parede da direita
        union{ 
                difference{  
                        object{parede rotate y*90 translate <8,0,2.5>
                        	
                        texture { pigment { image_map {"tile.jpg"} rotate y*90}
                         //normal { bumps 0.5 scale 0.00000001 }
                           finish { diffuse 0.9 phong 1 reflection 0.00}
                        } }  //<-6,0,2.5>  }
                        box { 
                	        <0, 0.3, 1>,< 2, 4, 2>  
                	        texture {  pigment { color Blue } } 
                	        translate <0, 0, 0> 	
                	        finish {           
                                        ambient 0.2    
                                        diffuse 0.2    
                                        specular 0.5
                                }   
                        rotate y*90 translate <7.9,4.2,-7.5> 
                        } 
                } 
                object{moldura rotate y*90 translate x*6.5} 
                object{moldura rotate y*90 translate x*6.5 translate z*-6.5}   
                object{moldura rotate y*90 translate x*6.5 translate z*-9}  
        }  
         
        
        //Parede da frente
        //object{parede scale x*1.2 translate <-7.5, 0, -15.3>} 
        union{  
                        object{parede scale x*1.6 translate <-13.5, 0, 1.5>                        	
                        pigment {White}
                                 //normal { bumps 0.5 scale 0.00000001 }
                                   finish { diffuse 0.9 phong 1 reflection 0.00}
                                 }                   
                        //Molduras         
                        object{moldura }
                        object{moldura translate x*6} 
                        object{moldura translate x*-6}  
                        object{moldura translate x*-9} 
                        rotate y*180 
                        translate <0,0,0>  
                        translate <0,0,-8> 
                        
                }   
        
           
        
        //M�rmore dos balc�es 
        object{marmore translate <12.5, 0, 4> scale x*0.5 rotate y*45  translate <-2, 0, 1.5>} 
        
        object{marmore rotate y*90 translate x*6.8 translate z*-0.3 } 
        
        
        //pinguim
        object {pinguim scale 0.3 rotate y*10 translate <-1.9, 7, 0.2> finish { phong 1 } }  
        
        
        //ima
        object{ima scale 0.2 rotate z*10 translate <-2.3,5.5,-0.68> } 
        object{ima2 scale 0.2 rotate z*10 translate <-1.3,4.8,-0.68> }     
        
        //mesa e cadeiras
        union{
                //mesa
                union{  
                        difference{ 
                                object{mesa scale 4.65 translate < -4, 0, -4> texture {BrushedNickelTexture}} 
                                        cylinder {
                                                <0, 1, 0>,     // Center of one end
                                                 <0, 2.03, 0>,     // Center of other end
                                                 2.55                  // Radius                  
                                                 translate<-1.2,1.60,-3.95>        
                                }
                        }
                        cylinder {
                                <0, 1, 0>,     // Center of one end
                                 <0, 1.03, 0>,     // Center of other end
                                 2.55            // Radius                  
                                 translate<-1.2,1.9,-3.95>        
                        } 
                        
                        
                        pigment { Col_Glass_General }
                    }  
                                                                                  
                //cadeiras
                object {K_Chair scale 0.045 rotate y*0 translate <-2.7,-0.2,-4.5>} 
                object {K_Chair scale 0.045 rotate y*91 translate <-1,-0.2,-2.6>} 
                object {K_Chair scale 0.045 rotate y*180 translate <1,-0.2,-4.5>} 
                object {K_Chair scale 0.045 rotate y*-91 translate <-1,-0.2,-5.7>}
                
                
                
                rotate y*25 translate <3,0,-3.7> 
        }  
        
        //plantas
        object{cacto scale 0.08 translate <7.5,3.6,-6>}
        
        union{
                object{New_plant_1 scale 0.00095 translate<0,4,0>} 
                object{full_plant_pot scale 0.1  scale 0.19  translate<0,3.65,0>} 
                
                translate<0.7,0,1.5>
        }  
        
        union{
                object{New_plant_1 scale 0.00095 translate<0,4,0>} 
                object{full_plant_pot scale 0.1  scale 0.19  translate<0,3.65,0>} 
                
                translate<-1,-0.7,-7.5>
        }
        
        //potes
        union{ 
                object{Pot scale 0.2 translate <7.5,4.85,-0.5>} 
                object{Pot scale 0.25 translate <7,4.85,-0.2>}  
                object{Pot scale 0.28 translate <6.5,4.85,0.2>} 
                translate <0.1, 0, 0.3>
        }  
          
        //garrafa
        object{garrafa  scale 0.34  translate <5.5,3.6,0.9> pigment { Col_Glass_Winebottle } }
        
        //jarra  
        object{jarra rotate x*-90 rotate y*15  scale 2.5 translate<1,3,-6>}     
        
        //leite
        object{leite scale 0.3 translate<-0.3,3.4,-6.5>}     
        
        //caneca
        object{caneca scale 0.45 translate<0.7,3.2,-6.9>}
        object{caneca scale 0.45 translate<0,3.65,0.8>} 
        
        //Prato
        object{cereal rotate x*-90 scale 0.7  translate<1.5,2.9,-7.7> }     
        
        union{          
                //cortina
                cylinder {
                        <0, 0, 0>,
                        <5.75, 0, 0>,
                        0.06 
                        translate <-0.7,8.4,2.2>
                        pigment{White}
                }  
                
                sphere {
                        <0, 1, 0>, 0.08 
                        pigment{White}
                        translate <-0.7,7.4,2.2> 
                } 
                
                sphere {
                        <0, 1, 0>, 0.08 
                        pigment{White}
                        translate <5.135,7.4,2.2> 
                } 
                
                
                //cortina        
             //   difference{
                        object{data_Plane_ob  rotate <90, 26, 0> translate <2.9,8,2.6> scale 0.8 scale x*0.95} 
                        
              /*          box {
                                <0, -3, 1>,< 1.5, 1, 1.5>
                                pigment{ Yellow }
                                translate <1.5,7.4,-0.5>
                                scale z*4
                        }  
                }      */ 
        } 
        
        union{          
                //cortina
                cylinder {
                        <0, 0, 0>,
                        <5.75, 0, 0>,
                        0.06 
                        translate <-0.7,8.4,2.2>
                        pigment{White}
                }  
                
                sphere {
                        <0, 1, 0>, 0.08 
                        pigment{White}
                        translate <-0.7,7.4,2.2> 
                } 
                
                sphere {
                        <0, 1, 0>, 0.08 
                        pigment{White}
                        translate <5.135,7.4,2.2> 
                } 
                
                
                //cortina        
             //   difference{
                        object{data_Plane_ob  rotate <90, 26, 0> translate <2.9,8,2.6> scale 0.8 scale x*0.95} 
                        
              /*          box {
                                <0, -3, 1>,< 1.5, 1, 1.5>
                                pigment{ Yellow }
                                translate <1.5,7.4,-0.5>
                                scale z*4
                        }  
                }      */   
                
                scale x*0.4
                rotate y*90
                translate <6.5,0,-7.5>
        }
        
        translate y*0.2    
        
              
  }       
