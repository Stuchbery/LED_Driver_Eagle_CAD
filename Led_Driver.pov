//POVRay-File created by 3d41.ulp v20110101
//C:/Users/jams/Documents/eagle/LED Driver/Led_Driver.brd
//10/3/2013 3:40:44 PM

#version 3.5;

//Set to on if the file should be used as .inc
#local use_file_as_inc = off;
#if(use_file_as_inc=off)


//changes the apperance of resistors (1 Blob / 0 real)
#declare global_res_shape = 1;
//randomize color of resistors 1=random 0=same color
#declare global_res_colselect = 0;
//Number of the color for the resistors
//0=Green, 1="normal color" 2=Blue 3=Brown
#declare global_res_col = 1;
//Set to on if you want to render the PCB upside-down
#declare pcb_upsidedown = off;
//Set to x or z to rotate around the corresponding axis (referring to pcb_upsidedown)
#declare pcb_rotdir = x;
//Set the length off short pins over the PCB
#declare pin_length = 2.5;
#declare global_diode_bend_radius = 1;
#declare global_res_bend_radius = 1;
#declare global_solder = on;

#declare global_show_screws = on;
#declare global_show_washers = on;
#declare global_show_nuts = on;

#declare global_use_radiosity = on;

#declare global_ambient_mul = 1;
#declare global_ambient_mul_emit = 0;

//Animation
#declare global_anim = off;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 2;
#declare pin_short = on;

#declare e3d_environment = off;

#local cam_x = 0;
#local cam_y = 512;
#local cam_z = -229;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -10;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 0;
#local pcb_rotate_z = 0;

#local pcb_board = on;
#local pcb_parts = on;
#local pcb_wire_bridges = off;
#if(global_fast_mode=off)
	#local pcb_polygons = on;
	#local pcb_silkscreen = on;
	#local pcb_wires = on;
	#local pcb_pads_smds = on;
#else
	#local pcb_polygons = off;
	#local pcb_silkscreen = off;
	#local pcb_wires = off;
	#local pcb_pads_smds = off;
#end

#local lgt1_pos_x = 60;
#local lgt1_pos_y = 91;
#local lgt1_pos_z = 53;
#local lgt1_intense = 0.928571;
#local lgt2_pos_x = -60;
#local lgt2_pos_y = 91;
#local lgt2_pos_z = 53;
#local lgt2_intense = 0.928571;
#local lgt3_pos_x = 60;
#local lgt3_pos_y = 91;
#local lgt3_pos_z = -36;
#local lgt3_intense = 0.928571;
#local lgt4_pos_x = -60;
#local lgt4_pos_y = 91;
#local lgt4_pos_z = -36;
#local lgt4_intense = 0.928571;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 160.000000;
#declare pcb_y_size = 100.000000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(944);
#declare global_pcb_layer_dis = array[16]
{
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	1.535000,
}
#declare global_pcb_real_hole = 2.000000;

#include "e3d_tools.inc"
#include "e3d_user.inc"

global_settings{charset utf8}

#if(e3d_environment=on)
sky_sphere {pigment {Navy}
pigment {bozo turbulence 0.65 octaves 7 omega 0.7 lambda 2
color_map {
[0.0 0.1 color rgb <0.85, 0.85, 0.85> color rgb <0.75, 0.75, 0.75>]
[0.1 0.5 color rgb <0.75, 0.75, 0.75> color rgbt <1, 1, 1, 1>]
[0.5 1.0 color rgbt <1, 1, 1, 1> color rgbt <1, 1, 1, 1>]}
scale <0.1, 0.5, 0.1>} rotate -90*x}
plane{y, -10.0-max(pcb_x_size,pcb_y_size)*abs(max(sin((pcb_rotate_x/180)*pi),sin((pcb_rotate_z/180)*pi)))
texture{T_Chrome_2D
normal{waves 0.1 frequency 3000.0 scale 3000.0}} translate<0,0,0>}
#end

//Animation data
#if(global_anim=on)
#declare global_anim_showcampath = no;
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_flight=0;
#warning "No/not enough Animation Data available (min. 3 points) (Flight path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_view=0;
#warning "No/not enough Animation Data available (min. 3 points) (View path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#end

#if((global_anim_showcampath=yes)&(global_anim=off))
#end
#if(global_anim=on)
camera
{
	location global_anim_spline_cam_flight(clock)
	#if(global_anim_npoints_cam_view>2)
		look_at global_anim_spline_cam_view(clock)
	#else
		look_at global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	angle 45
}
light_source
{
	global_anim_spline_cam_flight(clock)
	color rgb <1,1,1>
	spotlight point_at 
	#if(global_anim_npoints_cam_view>2)
		global_anim_spline_cam_view(clock)
	#else
		global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	radius 35 falloff  40
}
#else
camera
{
	location <cam_x,cam_y,cam_z>
	look_at <cam_look_x,cam_look_y,cam_look_z>
	angle cam_a
	//translates the camera that <0,0,0> is over the Eagle <0,0>
	//translate<-80.000000,0,-50.000000>
}
#end

background{col_bgr}
light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro LED_DRIVER(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<0.000000,0.000000><160.000000,0.000000>
<160.000000,0.000000><160.000000,100.000000>
<160.000000,100.000000><0.000000,100.000000>
<0.000000,100.000000><0.000000,0.000000>
texture{col_brd}}
}//End union(PCB)
//Holes(real)/Parts
//Holes(real)/Board
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_IC2) #declare global_pack_IC2=yes; object {IC_SMD_SO14("74S08D","AMD",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<55.840000,0.000000,44.480000>translate<0,0.035000,0> }#end		//SMD IC SO14 Package IC2 74S08D SO14
#ifndef(pack_IC4) #declare global_pack_IC4=yes; object {IC_SMD_SO14("74S08D","ATMEL",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<71.050000,0.000000,19.160000>translate<0,0.035000,0> }#end		//SMD IC SO14 Package IC4 74S08D SO14
#ifndef(pack_IC5) #declare global_pack_IC5=yes; object {IC_SMD_SO14("74S08D","ATMEL",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<103.620000,0.000000,27.160000>translate<0,0.035000,0> }#end		//SMD IC SO14 Package IC5 74S08D SO14
#ifndef(pack_IC6) #declare global_pack_IC6=yes; object {IC_SMD_SO14("74S08D","ATMEL",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<74.750000,0.000000,35.860000>translate<0,0.035000,0> }#end		//SMD IC SO14 Package IC6 74S08D SO14
#ifndef(pack_IC9) #declare global_pack_IC9=yes; object {IC_SMD_SO14("74S08D","ATMEL",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<26.560000,0.000000,41.250000>translate<0,0.035000,0> }#end		//SMD IC SO14 Package IC9 74S08D SO14
#ifndef(pack_IC11) #declare global_pack_IC11=yes; object {IC_SMD_SO14("74S08D","ATMEL",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<39.440000,0.000000,52.050000>translate<0,0.035000,0> }#end		//SMD IC SO14 Package IC11 74S08D SO14
#ifndef(pack_IC12) #declare global_pack_IC12=yes; object {IC_SMD_SO14("74S08D","ATMEL",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<53.040000,0.000000,71.530000>translate<0,0.035000,0> }#end		//SMD IC SO14 Package IC12 74S08D SO14
#ifndef(pack_IC13) #declare global_pack_IC13=yes; object {IC_SMD_SO14("74S08D","ATMEL",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<52.990000,0.000000,60.530000>translate<0,0.035000,0> }#end		//SMD IC SO14 Package IC13 74S08D SO14
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<32.286800,0.000000,14.525000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<32.286800,0.000000,15.160000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<32.286800,0.000000,15.795000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<32.286800,0.000000,16.430000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<32.286800,0.000000,17.065000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<32.286800,0.000000,17.700000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<32.286800,0.000000,18.335000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<32.286800,0.000000,18.970000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<32.286800,0.000000,19.605000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<32.286800,0.000000,20.240000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<32.286800,0.000000,20.875000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<32.286800,0.000000,21.510000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<32.286800,0.000000,22.145000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<32.286800,0.000000,22.780000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<32.286800,0.000000,23.415000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<32.286800,0.000000,24.050000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<32.286800,0.000000,24.685000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<32.286800,0.000000,25.320000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<32.286800,0.000000,25.955000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<32.286800,0.000000,26.590000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<32.286800,0.000000,27.225000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<32.286800,0.000000,27.860000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<32.286800,0.000000,28.495000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<32.286800,0.000000,29.130000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.533200,0.000000,29.130000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.533200,0.000000,28.495000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.533200,0.000000,27.860000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.533200,0.000000,27.225000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.533200,0.000000,26.590000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.533200,0.000000,25.955000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.533200,0.000000,25.320000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.533200,0.000000,24.685000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.533200,0.000000,24.050000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.533200,0.000000,23.415000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.533200,0.000000,22.780000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.533200,0.000000,22.145000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.533200,0.000000,21.510000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.533200,0.000000,20.875000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.533200,0.000000,20.240000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.533200,0.000000,19.605000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.533200,0.000000,18.970000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.533200,0.000000,18.335000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.533200,0.000000,17.700000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.533200,0.000000,17.065000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.533200,0.000000,16.430000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.533200,0.000000,15.795000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.533200,0.000000,15.160000>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.533200,0.000000,14.525000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<58.913400,0.000000,40.670000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<58.913400,0.000000,41.940000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<58.913400,0.000000,43.210000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<58.913400,0.000000,44.480000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<58.913400,0.000000,45.750000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<58.913400,0.000000,47.020000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<58.913400,0.000000,48.290000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<52.766600,0.000000,48.290000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<52.766600,0.000000,47.020000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<52.766600,0.000000,45.750000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<52.766600,0.000000,44.480000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<52.766600,0.000000,43.210000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<52.766600,0.000000,41.940000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<52.766600,0.000000,40.670000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<67.240000,0.000000,16.086600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<68.510000,0.000000,16.086600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<69.780000,0.000000,16.086600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<71.050000,0.000000,16.086600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<72.320000,0.000000,16.086600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<73.590000,0.000000,16.086600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<74.860000,0.000000,16.086600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<74.860000,0.000000,22.233400>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<73.590000,0.000000,22.233400>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<72.320000,0.000000,22.233400>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<71.050000,0.000000,22.233400>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<69.780000,0.000000,22.233400>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<68.510000,0.000000,22.233400>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<67.240000,0.000000,22.233400>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<99.810000,0.000000,24.086600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<101.080000,0.000000,24.086600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<102.350000,0.000000,24.086600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<103.620000,0.000000,24.086600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<104.890000,0.000000,24.086600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<106.160000,0.000000,24.086600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<107.430000,0.000000,24.086600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<107.430000,0.000000,30.233400>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<106.160000,0.000000,30.233400>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<104.890000,0.000000,30.233400>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<103.620000,0.000000,30.233400>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<102.350000,0.000000,30.233400>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<101.080000,0.000000,30.233400>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<99.810000,0.000000,30.233400>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<70.940000,0.000000,32.786600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<72.210000,0.000000,32.786600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<73.480000,0.000000,32.786600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<74.750000,0.000000,32.786600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<76.020000,0.000000,32.786600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<77.290000,0.000000,32.786600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<78.560000,0.000000,32.786600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<78.560000,0.000000,38.933400>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<77.290000,0.000000,38.933400>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<76.020000,0.000000,38.933400>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<74.750000,0.000000,38.933400>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<73.480000,0.000000,38.933400>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<72.210000,0.000000,38.933400>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<70.940000,0.000000,38.933400>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<10.415000,0.000000,62.383200>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<11.050000,0.000000,62.383200>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<11.685000,0.000000,62.383200>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<12.320000,0.000000,62.383200>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<12.955000,0.000000,62.383200>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<13.590000,0.000000,62.383200>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<14.225000,0.000000,62.383200>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<14.860000,0.000000,62.383200>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<15.495000,0.000000,62.383200>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<16.130000,0.000000,62.383200>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<16.765000,0.000000,62.383200>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<17.400000,0.000000,62.383200>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<18.035000,0.000000,62.383200>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<18.670000,0.000000,62.383200>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<19.305000,0.000000,62.383200>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<19.940000,0.000000,62.383200>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<20.575000,0.000000,62.383200>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<21.210000,0.000000,62.383200>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<21.845000,0.000000,62.383200>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<22.480000,0.000000,62.383200>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<23.115000,0.000000,62.383200>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<23.750000,0.000000,62.383200>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<24.385000,0.000000,62.383200>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<25.020000,0.000000,62.383200>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<25.020000,0.000000,72.136800>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<24.385000,0.000000,72.136800>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<23.750000,0.000000,72.136800>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<23.115000,0.000000,72.136800>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<22.480000,0.000000,72.136800>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<21.845000,0.000000,72.136800>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<21.210000,0.000000,72.136800>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<20.575000,0.000000,72.136800>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<19.940000,0.000000,72.136800>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<19.305000,0.000000,72.136800>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<18.670000,0.000000,72.136800>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<18.035000,0.000000,72.136800>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<17.400000,0.000000,72.136800>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<16.765000,0.000000,72.136800>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<16.130000,0.000000,72.136800>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<15.495000,0.000000,72.136800>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<14.860000,0.000000,72.136800>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<14.225000,0.000000,72.136800>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<13.590000,0.000000,72.136800>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<12.955000,0.000000,72.136800>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<12.320000,0.000000,72.136800>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<11.685000,0.000000,72.136800>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<11.050000,0.000000,72.136800>}
object{TOOLS_PCB_SMD(0.304800,1.422400,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<10.415000,0.000000,72.136800>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<23.486600,0.000000,45.060000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<23.486600,0.000000,43.790000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<23.486600,0.000000,42.520000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<23.486600,0.000000,41.250000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<23.486600,0.000000,39.980000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<23.486600,0.000000,38.710000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<23.486600,0.000000,37.440000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<29.633400,0.000000,37.440000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<29.633400,0.000000,38.710000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<29.633400,0.000000,39.980000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<29.633400,0.000000,41.250000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<29.633400,0.000000,42.520000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<29.633400,0.000000,43.790000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<29.633400,0.000000,45.060000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<42.513400,0.000000,48.240000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<42.513400,0.000000,49.510000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<42.513400,0.000000,50.780000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<42.513400,0.000000,52.050000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<42.513400,0.000000,53.320000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<42.513400,0.000000,54.590000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<42.513400,0.000000,55.860000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<36.366600,0.000000,55.860000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<36.366600,0.000000,54.590000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<36.366600,0.000000,53.320000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<36.366600,0.000000,52.050000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<36.366600,0.000000,50.780000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<36.366600,0.000000,49.510000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<36.366600,0.000000,48.240000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<49.230000,0.000000,68.456600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<50.500000,0.000000,68.456600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<51.770000,0.000000,68.456600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<53.040000,0.000000,68.456600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<54.310000,0.000000,68.456600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<55.580000,0.000000,68.456600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<56.850000,0.000000,68.456600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<56.850000,0.000000,74.603400>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<55.580000,0.000000,74.603400>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<54.310000,0.000000,74.603400>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<53.040000,0.000000,74.603400>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<51.770000,0.000000,74.603400>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<50.500000,0.000000,74.603400>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<49.230000,0.000000,74.603400>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<49.180000,0.000000,57.456600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<50.450000,0.000000,57.456600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<51.720000,0.000000,57.456600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<52.990000,0.000000,57.456600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<54.260000,0.000000,57.456600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<55.530000,0.000000,57.456600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<56.800000,0.000000,57.456600>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<56.800000,0.000000,63.603400>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<55.530000,0.000000,63.603400>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<54.260000,0.000000,63.603400>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<52.990000,0.000000,63.603400>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<51.720000,0.000000,63.603400>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<50.450000,0.000000,63.603400>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<49.180000,0.000000,63.603400>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<74.560000,0.000000,55.360000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<74.560000,0.000000,54.090000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<74.560000,0.000000,52.820000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<74.560000,0.000000,51.550000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<74.560000,0.000000,50.280000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<74.560000,0.000000,49.010000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<74.560000,0.000000,47.740000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<74.560000,0.000000,46.470000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<74.560000,0.000000,45.200000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<81.760000,0.000000,45.200000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<81.760000,0.000000,46.470000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<81.760000,0.000000,47.740000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<81.760000,0.000000,49.010000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<81.760000,0.000000,50.280000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<81.760000,0.000000,51.550000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<81.760000,0.000000,52.820000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<81.760000,0.000000,54.090000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<81.760000,0.000000,55.360000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<129.440000,0.000000,63.420000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<129.440000,0.000000,64.690000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<129.440000,0.000000,65.960000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<129.440000,0.000000,67.230000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<129.440000,0.000000,68.500000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<129.440000,0.000000,69.770000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<129.440000,0.000000,71.040000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<129.440000,0.000000,72.310000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<129.440000,0.000000,73.580000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<122.240000,0.000000,73.580000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<122.240000,0.000000,72.310000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<122.240000,0.000000,71.040000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<122.240000,0.000000,69.770000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<122.240000,0.000000,68.500000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<122.240000,0.000000,67.230000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<122.240000,0.000000,65.960000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<122.240000,0.000000,64.690000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<122.240000,0.000000,63.420000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<129.040000,0.000000,45.910000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<129.040000,0.000000,47.180000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<129.040000,0.000000,48.450000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<129.040000,0.000000,49.720000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<129.040000,0.000000,50.990000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<129.040000,0.000000,52.260000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<129.040000,0.000000,53.530000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<129.040000,0.000000,54.800000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<129.040000,0.000000,56.070000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<121.840000,0.000000,56.070000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<121.840000,0.000000,54.800000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<121.840000,0.000000,53.530000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<121.840000,0.000000,52.260000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<121.840000,0.000000,50.990000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<121.840000,0.000000,49.720000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<121.840000,0.000000,48.450000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<121.840000,0.000000,47.180000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<121.840000,0.000000,45.910000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<73.960000,0.000000,73.310000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<73.960000,0.000000,72.040000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<73.960000,0.000000,70.770000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<73.960000,0.000000,69.500000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<73.960000,0.000000,68.230000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<73.960000,0.000000,66.960000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<73.960000,0.000000,65.690000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<73.960000,0.000000,64.420000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<73.960000,0.000000,63.150000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<81.160000,0.000000,63.150000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<81.160000,0.000000,64.420000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<81.160000,0.000000,65.690000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<81.160000,0.000000,66.960000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<81.160000,0.000000,68.230000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<81.160000,0.000000,69.500000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<81.160000,0.000000,70.770000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<81.160000,0.000000,72.040000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<81.160000,0.000000,73.310000>}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<102.140000,0,43.880000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<100.140000,0,43.880000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<102.140000,0,45.880000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<100.140000,0,45.880000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<102.140000,0,47.880000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<100.140000,0,47.880000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<102.140000,0,49.880000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<100.140000,0,49.880000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<102.140000,0,51.880000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<100.140000,0,51.880000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<102.140000,0,53.880000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<100.140000,0,53.880000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<102.140000,0,55.880000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<100.140000,0,55.880000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<102.140000,0,57.880000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<100.140000,0,57.880000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<102.140000,0,59.880000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<100.140000,0,59.880000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<102.140000,0,61.880000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<100.140000,0,61.880000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<102.140000,0,63.880000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<100.140000,0,63.880000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<102.140000,0,65.880000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<100.140000,0,65.880000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<102.140000,0,67.880000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<100.140000,0,67.880000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<102.140000,0,69.880000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<100.140000,0,69.880000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<102.140000,0,71.880000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<100.140000,0,71.880000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<102.140000,0,73.880000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<100.140000,0,73.880000> texture{col_thl}}
//Pads/Vias
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<76.000000,0,47.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<76.000000,0,53.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<23.500000,0,18.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<57.500000,0,33.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<34.000000,0,20.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<37.000000,0,21.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<24.000000,0,19.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<37.000000,0,18.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<24.000000,0,19.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<33.500000,0,19.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<39.500000,0,16.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<24.000000,0,21.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<31.000000,0,20.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<69.000000,0,18.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<24.000000,0,21.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<31.000000,0,21.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<73.000000,0,22.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<24.000000,0,22.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<31.000000,0,22.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<69.000000,0,21.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<34.000000,0,22.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<99.500000,0,22.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<24.000000,0,24.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<103.000000,0,23.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<34.000000,0,24.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<106.000000,0,28.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<24.000000,0,26.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<101.500000,0,28.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<24.000000,0,26.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<31.000000,0,26.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<70.500000,0,30.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<24.000000,0,28.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<31.000000,0,27.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<74.000000,0,31.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<77.000000,0,37.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<34.500000,0,35.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<90.000000,0,54.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<77.000000,0,31.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<100.500000,0,31.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<69.500000,0,52.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<73.000000,0,54.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<56.000000,0,51.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<73.000000,0,51.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<51.000000,0,46.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<73.000000,0,50.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<71.500000,0,44.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<73.000000,0,45.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<103.000000,0,24.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<129.500000,0,62.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<119.000000,0,37.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<129.000000,0,64.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<107.500000,0,62.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<128.000000,0,65.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<71.500000,0,55.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<128.500000,0,73.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<78.500000,0,40.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<128.000000,0,71.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<78.000000,0,31.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<116.500000,0,31.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<73.500000,0,35.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<131.000000,0,68.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<107.000000,0,62.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<128.000000,0,66.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<12.500000,0,56.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<22.500000,0,46.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<13.000000,0,71.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<22.000000,0,47.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<27.000000,0,38.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<13.000000,0,52.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<22.500000,0,53.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<14.500000,0,61.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<38.000000,0,48.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<21.000000,0,50.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<21.000000,0,56.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<41.000000,0,53.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<17.500000,0,69.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<35.000000,0,58.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<18.000000,0,63.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<48.500000,0,66.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<21.000000,0,73.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<53.000000,0,71.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<54.500000,0,76.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<22.000000,0,74.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<20.500000,0,67.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<51.000000,0,73.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<22.500000,0,65.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<47.000000,0,59.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<22.500000,0,61.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<52.000000,0,59.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<24.500000,0,71.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<55.000000,0,67.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<24.500000,0,63.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<51.000000,0,65.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<25.000000,0,41.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<121.500000,0,38.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<28.000000,0,39.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<122.500000,0,41.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<34.000000,0,41.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<121.500000,0,41.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<31.000000,0,41.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<127.500000,0,48.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<45.000000,0,50.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<127.500000,0,50.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<40.500000,0,56.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<126.500000,0,52.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<47.500000,0,54.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<127.500000,0,53.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<55.500000,0,70.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<72.500000,0,72.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<60.000000,0,71.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<72.500000,0,71.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<54.000000,0,65.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<73.500000,0,65.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<57.500000,0,64.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<73.000000,0,65.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<55.500000,0,59.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<70.000000,0,63.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<35.500000,0,35.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<72.500000,0,37.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<11.000000,0,63.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<92.500000,0,54.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<94.500000,0,53.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<96.500000,0,51.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<97.000000,0,51.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<106.000000,0,63.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<105.000000,0,64.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<104.500000,0,67.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<104.500000,0,68.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<104.500000,0,69.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<104.500000,0,71.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<91.000000,0,64.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<94.000000,0,65.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<96.000000,0,67.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<97.500000,0,68.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<98.000000,0,67.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<108.500000,0,55.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<108.000000,0,52.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<108.000000,0,51.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<108.000000,0,49.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<108.000000,0,48.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<108.000000,0,47.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<68.000000,0,32.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<70.500000,0,34.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<56.500000,0,34.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<99.500000,0,32.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.457200,0.050800,1,16,1,0) translate<36.000000,0,34.500000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<10.000000,0.000000,73.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<10.000000,0.000000,63.000000>}
box{<0,0,-0.012700><10.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<10.000000,0.000000,63.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<10.000000,0.000000,63.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<10.500000,0.000000,62.500000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<10.000000,0.000000,63.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<10.415000,0.000000,62.383200>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<10.500000,0.000000,62.500000>}
box{<0,0,-0.012700><0.144455,0.035000,0.012700> rotate<0,-53.951569,0> translate<10.415000,0.000000,62.383200> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<10.415000,0.000000,72.136800>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<10.500000,0.000000,72.500000>}
box{<0,0,-0.012700><0.373014,0.035000,0.012700> rotate<0,-76.823013,0> translate<10.415000,0.000000,72.136800> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<10.500000,0.000000,73.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<10.500000,0.000000,72.500000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<10.500000,0.000000,72.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<11.000000,-1.535000,53.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<11.000000,-1.535000,63.500000>}
box{<0,0,-0.012700><10.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<11.000000,-1.535000,63.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<11.000000,0.000000,63.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<11.000000,0.000000,72.000000>}
box{<0,0,-0.012700><8.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<11.000000,0.000000,72.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<11.000000,0.000000,62.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<11.050000,0.000000,62.383200>}
box{<0,0,-0.012700><0.386448,0.035000,0.012700> rotate<0,-82.560586,0> translate<11.000000,0.000000,62.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<11.000000,0.000000,72.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<11.050000,0.000000,72.136800>}
box{<0,0,-0.012700><0.145651,0.035000,0.012700> rotate<0,-69.918175,0> translate<11.000000,0.000000,72.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<11.000000,0.000000,62.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<12.500000,0.000000,60.500000>}
box{<0,0,-0.012700><2.121320,0.035000,0.012700> rotate<0,44.997030,0> translate<11.000000,0.000000,62.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<12.500000,0.000000,56.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<12.500000,0.000000,60.500000>}
box{<0,0,-0.012700><4.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<12.500000,0.000000,60.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<10.500000,0.000000,73.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<12.500000,0.000000,75.000000>}
box{<0,0,-0.012700><2.828427,0.035000,0.012700> rotate<0,-44.997030,0> translate<10.500000,0.000000,73.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<10.000000,0.000000,73.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<12.500000,0.000000,75.500000>}
box{<0,0,-0.012700><3.535534,0.035000,0.012700> rotate<0,-44.997030,0> translate<10.000000,0.000000,73.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<13.000000,0.000000,62.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<13.000000,0.000000,52.500000>}
box{<0,0,-0.012700><9.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<13.000000,0.000000,52.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<11.000000,-1.535000,53.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<13.000000,-1.535000,53.000000>}
box{<0,0,-0.012700><2.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<11.000000,-1.535000,53.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<12.955000,0.000000,62.383200>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<13.000000,0.000000,62.000000>}
box{<0,0,-0.012700><0.385833,0.035000,0.012700> rotate<0,83.296811,0> translate<12.955000,0.000000,62.383200> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<12.955000,0.000000,62.383200>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<13.000000,0.000000,62.500000>}
box{<0,0,-0.012700><0.125169,0.035000,0.012700> rotate<0,-68.925076,0> translate<12.955000,0.000000,62.383200> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<13.000000,0.000000,70.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<13.000000,0.000000,62.500000>}
box{<0,0,-0.012700><8.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<13.000000,0.000000,62.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<13.000000,-1.535000,56.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<13.000000,-1.535000,71.000000>}
box{<0,0,-0.012700><15.000000,0.035000,0.012700> rotate<0,90.000000,0> translate<13.000000,-1.535000,71.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<12.955000,0.000000,72.136800>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<13.000000,0.000000,72.000000>}
box{<0,0,-0.012700><0.144011,0.035000,0.012700> rotate<0,71.786778,0> translate<12.955000,0.000000,72.136800> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<13.000000,0.000000,71.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<13.000000,0.000000,72.000000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,90.000000,0> translate<13.000000,0.000000,72.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<13.500000,0.000000,70.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<13.500000,0.000000,62.500000>}
box{<0,0,-0.012700><7.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<13.500000,0.000000,62.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<13.000000,0.000000,70.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<13.500000,0.000000,71.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,-44.997030,0> translate<13.000000,0.000000,70.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<13.500000,0.000000,72.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<13.500000,0.000000,71.000000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<13.500000,0.000000,71.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<13.500000,0.000000,62.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<13.590000,0.000000,62.383200>}
box{<0,0,-0.012700><0.393627,0.035000,0.012700> rotate<0,-76.777750,0> translate<13.500000,0.000000,62.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<13.500000,0.000000,62.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<13.590000,0.000000,62.383200>}
box{<0,0,-0.012700><0.147453,0.035000,0.012700> rotate<0,52.380568,0> translate<13.500000,0.000000,62.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<13.500000,0.000000,72.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<13.590000,0.000000,72.136800>}
box{<0,0,-0.012700><0.163751,0.035000,0.012700> rotate<0,-56.655553,0> translate<13.500000,0.000000,72.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<13.500000,0.000000,62.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<14.500000,0.000000,61.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,44.997030,0> translate<13.500000,0.000000,62.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<15.000000,0.000000,62.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<15.000000,0.000000,56.000000>}
box{<0,0,-0.012700><6.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<15.000000,0.000000,56.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<14.860000,0.000000,62.383200>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<15.000000,0.000000,62.000000>}
box{<0,0,-0.012700><0.407973,0.035000,0.012700> rotate<0,69.925888,0> translate<14.860000,0.000000,62.383200> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<14.860000,0.000000,62.383200>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<15.000000,0.000000,62.500000>}
box{<0,0,-0.012700><0.182325,0.035000,0.012700> rotate<0,-39.835131,0> translate<14.860000,0.000000,62.383200> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<15.000000,0.000000,71.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<15.000000,0.000000,62.500000>}
box{<0,0,-0.012700><8.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<15.000000,0.000000,62.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<13.500000,0.000000,70.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<15.000000,0.000000,71.500000>}
box{<0,0,-0.012700><2.121320,0.035000,0.012700> rotate<0,-44.997030,0> translate<13.500000,0.000000,70.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<15.000000,0.000000,72.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<15.000000,0.000000,71.500000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<15.000000,0.000000,71.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<14.860000,0.000000,72.136800>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<15.000000,0.000000,72.000000>}
box{<0,0,-0.012700><0.195740,0.035000,0.012700> rotate<0,44.334724,0> translate<14.860000,0.000000,72.136800> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<15.495000,0.000000,62.383200>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<15.500000,0.000000,62.000000>}
box{<0,0,-0.012700><0.383233,0.035000,0.012700> rotate<0,89.246556,0> translate<15.495000,0.000000,62.383200> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<15.000000,0.000000,71.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<15.500000,0.000000,71.500000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,-44.997030,0> translate<15.000000,0.000000,71.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<15.500000,0.000000,72.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<15.500000,0.000000,71.500000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<15.500000,0.000000,71.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<15.495000,0.000000,72.136800>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<15.500000,0.000000,72.000000>}
box{<0,0,-0.012700><0.136891,0.035000,0.012700> rotate<0,87.900986,0> translate<15.495000,0.000000,72.136800> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<16.000000,0.000000,72.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<16.000000,0.000000,62.500000>}
box{<0,0,-0.012700><9.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<16.000000,0.000000,62.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<16.000000,0.000000,62.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<16.130000,0.000000,62.383200>}
box{<0,0,-0.012700><0.404651,0.035000,0.012700> rotate<0,-71.255872,0> translate<16.000000,0.000000,62.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<16.000000,0.000000,62.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<16.130000,0.000000,62.383200>}
box{<0,0,-0.012700><0.174763,0.035000,0.012700> rotate<0,41.935707,0> translate<16.000000,0.000000,62.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<16.000000,0.000000,72.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<16.130000,0.000000,72.136800>}
box{<0,0,-0.012700><0.188717,0.035000,0.012700> rotate<0,-46.456930,0> translate<16.000000,0.000000,72.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<16.000000,0.000000,62.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<17.500000,0.000000,60.500000>}
box{<0,0,-0.012700><2.121320,0.035000,0.012700> rotate<0,44.997030,0> translate<16.000000,0.000000,62.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<17.400000,0.000000,62.383200>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<17.500000,0.000000,62.500000>}
box{<0,0,-0.012700><0.153760,0.035000,0.012700> rotate<0,-49.427777,0> translate<17.400000,0.000000,62.383200> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<17.500000,0.000000,69.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<17.500000,0.000000,62.500000>}
box{<0,0,-0.012700><6.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<17.500000,0.000000,62.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<17.500000,-1.535000,58.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<17.500000,-1.535000,69.500000>}
box{<0,0,-0.012700><11.000000,0.035000,0.012700> rotate<0,90.000000,0> translate<17.500000,-1.535000,69.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<17.400000,0.000000,72.136800>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<17.500000,0.000000,72.000000>}
box{<0,0,-0.012700><0.169453,0.035000,0.012700> rotate<0,53.829862,0> translate<17.400000,0.000000,72.136800> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<17.500000,0.000000,69.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<17.500000,0.000000,72.000000>}
box{<0,0,-0.012700><2.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<17.500000,0.000000,72.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<18.000000,0.000000,63.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<18.000000,0.000000,62.500000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<18.000000,0.000000,62.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<17.500000,0.000000,69.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<18.000000,0.000000,69.500000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,-44.997030,0> translate<17.500000,0.000000,69.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<18.000000,0.000000,72.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<18.000000,0.000000,69.500000>}
box{<0,0,-0.012700><2.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<18.000000,0.000000,69.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<18.000000,0.000000,72.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<18.000000,0.000000,74.500000>}
box{<0,0,-0.012700><2.000000,0.035000,0.012700> rotate<0,90.000000,0> translate<18.000000,0.000000,74.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<18.000000,0.000000,62.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<18.035000,0.000000,62.383200>}
box{<0,0,-0.012700><0.121931,0.035000,0.012700> rotate<0,73.313920,0> translate<18.000000,0.000000,62.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<18.000000,0.000000,72.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<18.035000,0.000000,72.136800>}
box{<0,0,-0.012700><0.141206,0.035000,0.012700> rotate<0,-75.643847,0> translate<18.000000,0.000000,72.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<18.000000,0.000000,72.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<18.035000,0.000000,72.136800>}
box{<0,0,-0.012700><0.364883,0.035000,0.012700> rotate<0,84.490076,0> translate<18.000000,0.000000,72.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<19.940000,0.000000,62.383200>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<20.000000,0.000000,62.500000>}
box{<0,0,-0.012700><0.131310,0.035000,0.012700> rotate<0,-62.806351,0> translate<19.940000,0.000000,62.383200> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<20.000000,0.000000,71.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<20.000000,0.000000,62.500000>}
box{<0,0,-0.012700><8.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<20.000000,0.000000,62.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<19.940000,0.000000,72.136800>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<20.000000,0.000000,72.500000>}
box{<0,0,-0.012700><0.368123,0.035000,0.012700> rotate<0,-80.614238,0> translate<19.940000,0.000000,72.136800> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<20.500000,0.000000,28.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<20.500000,0.000000,14.000000>}
box{<0,0,-0.012700><14.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<20.500000,0.000000,14.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<20.500000,0.000000,67.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<20.500000,0.000000,62.500000>}
box{<0,0,-0.012700><5.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<20.500000,0.000000,62.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<20.000000,0.000000,71.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<20.500000,0.000000,71.500000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,-44.997030,0> translate<20.000000,0.000000,71.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<20.500000,0.000000,72.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<20.500000,0.000000,71.500000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<20.500000,0.000000,71.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<20.500000,0.000000,62.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<20.575000,0.000000,62.383200>}
box{<0,0,-0.012700><0.138806,0.035000,0.012700> rotate<0,57.290754,0> translate<20.500000,0.000000,62.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<20.500000,0.000000,72.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<20.575000,0.000000,72.136800>}
box{<0,0,-0.012700><0.156010,0.035000,0.012700> rotate<0,-61.262394,0> translate<20.500000,0.000000,72.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<20.500000,0.000000,72.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<20.575000,0.000000,72.136800>}
box{<0,0,-0.012700><0.370863,0.035000,0.012700> rotate<0,78.327372,0> translate<20.500000,0.000000,72.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<21.000000,0.000000,28.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<21.000000,0.000000,14.500000>}
box{<0,0,-0.012700><14.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<21.000000,0.000000,14.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<15.000000,0.000000,56.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<21.000000,0.000000,50.000000>}
box{<0,0,-0.012700><8.485281,0.035000,0.012700> rotate<0,44.997030,0> translate<15.000000,0.000000,56.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<15.500000,0.000000,62.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<21.000000,0.000000,56.500000>}
box{<0,0,-0.012700><7.778175,0.035000,0.012700> rotate<0,44.997030,0> translate<15.500000,0.000000,62.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<18.000000,-1.535000,63.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<21.000000,-1.535000,66.500000>}
box{<0,0,-0.012700><4.242641,0.035000,0.012700> rotate<0,-44.997030,0> translate<18.000000,-1.535000,63.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<20.000000,0.000000,72.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<21.000000,0.000000,73.500000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,-44.997030,0> translate<20.000000,0.000000,72.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<21.500000,0.000000,15.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<21.500000,0.000000,28.500000>}
box{<0,0,-0.012700><13.000000,0.035000,0.012700> rotate<0,90.000000,0> translate<21.500000,0.000000,28.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<21.000000,0.000000,28.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<21.500000,0.000000,29.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,-44.997030,0> translate<21.000000,0.000000,28.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<17.500000,0.000000,60.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<21.500000,0.000000,60.500000>}
box{<0,0,-0.012700><4.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<17.500000,0.000000,60.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<21.500000,0.000000,39.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<21.500000,0.000000,60.500000>}
box{<0,0,-0.012700><21.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<21.500000,0.000000,60.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<13.000000,-1.535000,56.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.000000,-1.535000,47.000000>}
box{<0,0,-0.012700><12.727922,0.035000,0.012700> rotate<0,44.997030,0> translate<13.000000,-1.535000,56.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.000000,0.000000,42.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.000000,0.000000,47.000000>}
box{<0,0,-0.012700><4.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<22.000000,0.000000,47.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<20.500000,0.000000,72.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.000000,0.000000,74.000000>}
box{<0,0,-0.012700><2.121320,0.035000,0.012700> rotate<0,-44.997030,0> translate<20.500000,0.000000,72.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<18.000000,0.000000,74.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.000000,0.000000,74.500000>}
box{<0,0,-0.012700><4.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<18.000000,0.000000,74.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<21.000000,0.000000,14.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.500000,0.000000,14.500000>}
box{<0,0,-0.012700><1.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<21.000000,0.000000,14.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<21.500000,0.000000,28.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.500000,0.000000,28.500000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<21.500000,0.000000,28.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<21.500000,0.000000,29.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.500000,0.000000,29.000000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<21.500000,0.000000,29.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<12.500000,-1.535000,56.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.500000,-1.535000,46.000000>}
box{<0,0,-0.012700><14.142136,0.035000,0.012700> rotate<0,44.997030,0> translate<12.500000,-1.535000,56.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.500000,0.000000,53.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.500000,0.000000,49.500000>}
box{<0,0,-0.012700><3.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<22.500000,0.000000,49.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<14.500000,-1.535000,61.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.500000,-1.535000,53.000000>}
box{<0,0,-0.012700><11.313708,0.035000,0.012700> rotate<0,44.997030,0> translate<14.500000,-1.535000,61.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.480000,0.000000,62.383200>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.500000,0.000000,62.000000>}
box{<0,0,-0.012700><0.383722,0.035000,0.012700> rotate<0,87.006583,0> translate<22.480000,0.000000,62.383200> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.500000,0.000000,61.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.500000,0.000000,62.000000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,90.000000,0> translate<22.500000,0.000000,62.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.480000,0.000000,72.136800>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.500000,0.000000,72.000000>}
box{<0,0,-0.012700><0.138254,0.035000,0.012700> rotate<0,81.676960,0> translate<22.480000,0.000000,72.136800> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.500000,0.000000,65.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.500000,0.000000,72.000000>}
box{<0,0,-0.012700><7.000000,0.035000,0.012700> rotate<0,90.000000,0> translate<22.500000,0.000000,72.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.500000,0.000000,14.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.533200,0.000000,14.525000>}
box{<0,0,-0.012700><0.041560,0.035000,0.012700> rotate<0,-36.977747,0> translate<22.500000,0.000000,14.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.500000,0.000000,28.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.533200,0.000000,28.495000>}
box{<0,0,-0.012700><0.033574,0.035000,0.012700> rotate<0,8.563953,0> translate<22.500000,0.000000,28.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.500000,0.000000,29.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.533200,0.000000,29.130000>}
box{<0,0,-0.012700><0.134172,0.035000,0.012700> rotate<0,-75.668765,0> translate<22.500000,0.000000,29.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.533200,0.000000,16.430000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,16.500000>}
box{<0,0,-0.012700><0.472019,0.035000,0.012700> rotate<0,-8.527802,0> translate<22.533200,0.000000,16.430000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.533200,0.000000,17.065000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,17.000000>}
box{<0,0,-0.012700><0.471304,0.035000,0.012700> rotate<0,7.926708,0> translate<22.533200,0.000000,17.065000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.533200,0.000000,18.970000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,19.000000>}
box{<0,0,-0.012700><0.467763,0.035000,0.012700> rotate<0,-3.676948,0> translate<22.533200,0.000000,18.970000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.533200,0.000000,19.605000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,19.500000>}
box{<0,0,-0.012700><0.478463,0.035000,0.012700> rotate<0,12.676042,0> translate<22.533200,0.000000,19.605000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.533200,0.000000,20.875000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,21.000000>}
box{<0,0,-0.012700><0.483247,0.035000,0.012700> rotate<0,-14.990000,0> translate<22.533200,0.000000,20.875000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.533200,0.000000,21.510000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,21.500000>}
box{<0,0,-0.012700><0.466907,0.035000,0.012700> rotate<0,1.227147,0> translate<22.533200,0.000000,21.510000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.533200,0.000000,22.145000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,22.000000>}
box{<0,0,-0.012700><0.488802,0.035000,0.012700> rotate<0,17.254990,0> translate<22.533200,0.000000,22.145000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.533200,0.000000,23.415000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,23.500000>}
box{<0,0,-0.012700><0.474476,0.035000,0.012700> rotate<0,-10.319286,0> translate<22.533200,0.000000,23.415000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.533200,0.000000,24.050000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,24.000000>}
box{<0,0,-0.012700><0.469470,0.035000,0.012700> rotate<0,6.113367,0> translate<22.533200,0.000000,24.050000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.533200,0.000000,25.955000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,26.000000>}
box{<0,0,-0.012700><0.468964,0.035000,0.012700> rotate<0,-5.505994,0> translate<22.533200,0.000000,25.955000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.533200,0.000000,26.590000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,26.500000>}
box{<0,0,-0.012700><0.475397,0.035000,0.012700> rotate<0,10.912119,0> translate<22.533200,0.000000,26.590000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.533200,0.000000,27.860000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,28.000000>}
box{<0,0,-0.012700><0.487342,0.035000,0.012700> rotate<0,-16.693638,0> translate<22.533200,0.000000,27.860000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<21.500000,0.000000,39.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,37.500000>}
box{<0,0,-0.012700><2.121320,0.035000,0.012700> rotate<0,44.997030,0> translate<21.500000,0.000000,39.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.000000,0.000000,42.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,41.500000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,44.997030,0> translate<22.000000,0.000000,42.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.500000,0.000000,46.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,45.500000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<22.500000,0.000000,46.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,45.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,45.500000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<23.000000,0.000000,45.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<21.500000,0.000000,60.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,60.500000>}
box{<0,0,-0.012700><1.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<21.500000,0.000000,60.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,62.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,60.500000>}
box{<0,0,-0.012700><1.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<23.000000,0.000000,60.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,72.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,62.500000>}
box{<0,0,-0.012700><9.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<23.000000,0.000000,62.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,62.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.115000,0.000000,62.383200>}
box{<0,0,-0.012700><0.400084,0.035000,0.012700> rotate<0,-73.290432,0> translate<23.000000,0.000000,62.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,62.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.115000,0.000000,62.383200>}
box{<0,0,-0.012700><0.163912,0.035000,0.012700> rotate<0,45.441912,0> translate<23.000000,0.000000,62.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,72.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.115000,0.000000,72.136800>}
box{<0,0,-0.012700><0.178716,0.035000,0.012700> rotate<0,-49.944842,0> translate<23.000000,0.000000,72.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,37.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.486600,0.000000,37.440000>}
box{<0,0,-0.012700><0.490285,0.035000,0.012700> rotate<0,7.028886,0> translate<23.000000,0.000000,37.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,41.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.486600,0.000000,41.250000>}
box{<0,0,-0.012700><0.547064,0.035000,0.012700> rotate<0,27.190899,0> translate<23.000000,0.000000,41.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,45.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.486600,0.000000,45.060000>}
box{<0,0,-0.012700><0.490285,0.035000,0.012700> rotate<0,-7.028886,0> translate<23.000000,0.000000,45.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,17.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.500000,0.000000,17.500000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,-44.997030,0> translate<23.000000,0.000000,17.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.500000,0.000000,18.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.500000,0.000000,17.500000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<23.500000,0.000000,17.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.500000,-1.535000,33.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.500000,-1.535000,18.500000>}
box{<0,0,-0.012700><14.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<23.500000,-1.535000,18.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.486600,0.000000,37.440000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.500000,0.000000,37.500000>}
box{<0,0,-0.012700><0.061478,0.035000,0.012700> rotate<0,-77.405432,0> translate<23.486600,0.000000,37.440000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.486600,0.000000,38.710000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.500000,0.000000,39.000000>}
box{<0,0,-0.012700><0.290309,0.035000,0.012700> rotate<0,-87.348657,0> translate<23.486600,0.000000,38.710000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.486600,0.000000,39.980000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.500000,0.000000,40.000000>}
box{<0,0,-0.012700><0.024074,0.035000,0.012700> rotate<0,-56.174207,0> translate<23.486600,0.000000,39.980000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.486600,0.000000,42.520000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.500000,0.000000,42.500000>}
box{<0,0,-0.012700><0.024074,0.035000,0.012700> rotate<0,56.174207,0> translate<23.486600,0.000000,42.520000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.486600,0.000000,43.790000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.500000,0.000000,43.500000>}
box{<0,0,-0.012700><0.290309,0.035000,0.012700> rotate<0,87.348657,0> translate<23.486600,0.000000,43.790000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.500000,0.000000,73.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.500000,0.000000,51.000000>}
box{<0,0,-0.012700><22.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<23.500000,0.000000,51.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.000000,0.000000,74.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.500000,0.000000,73.000000>}
box{<0,0,-0.012700><2.121320,0.035000,0.012700> rotate<0,44.997030,0> translate<22.000000,0.000000,74.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,19.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.000000,0.000000,19.000000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<23.000000,0.000000,19.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,19.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.000000,0.000000,19.500000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<23.000000,0.000000,19.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,21.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.000000,0.000000,21.000000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<23.000000,0.000000,21.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,21.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.000000,0.000000,21.500000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<23.000000,0.000000,21.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,22.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.000000,0.000000,22.000000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<23.000000,0.000000,22.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,24.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.000000,0.000000,24.000000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<23.000000,0.000000,24.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,26.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.000000,0.000000,26.000000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<23.000000,0.000000,26.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,26.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.000000,0.000000,26.500000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<23.000000,0.000000,26.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,28.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.000000,0.000000,28.000000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<23.000000,0.000000,28.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,16.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.500000,0.000000,18.000000>}
box{<0,0,-0.012700><2.121320,0.035000,0.012700> rotate<0,-44.997030,0> translate<23.000000,0.000000,16.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.500000,0.000000,22.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.500000,0.000000,18.000000>}
box{<0,0,-0.012700><4.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<24.500000,0.000000,18.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.000000,-1.535000,19.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.500000,-1.535000,18.500000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<24.000000,-1.535000,19.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.000000,-1.535000,19.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.500000,-1.535000,19.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<24.000000,-1.535000,19.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.000000,-1.535000,21.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.500000,-1.535000,20.500000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<24.000000,-1.535000,21.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.000000,0.000000,23.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.500000,0.000000,22.000000>}
box{<0,0,-0.012700><2.121320,0.035000,0.012700> rotate<0,44.997030,0> translate<23.000000,0.000000,23.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.000000,-1.535000,24.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.500000,-1.535000,23.500000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<24.000000,-1.535000,24.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<20.500000,0.000000,28.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.500000,0.000000,32.500000>}
box{<0,0,-0.012700><5.656854,0.035000,0.012700> rotate<0,-44.997030,0> translate<20.500000,0.000000,28.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.500000,0.000000,22.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.500000,0.000000,32.500000>}
box{<0,0,-0.012700><10.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<24.500000,0.000000,32.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.500000,0.000000,37.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.500000,0.000000,36.500000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,44.997030,0> translate<23.500000,0.000000,37.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.500000,0.000000,32.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.500000,0.000000,36.500000>}
box{<0,0,-0.012700><4.000000,0.035000,0.012700> rotate<0,90.000000,0> translate<24.500000,0.000000,36.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<21.000000,-1.535000,56.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.500000,-1.535000,53.000000>}
box{<0,0,-0.012700><4.949747,0.035000,0.012700> rotate<0,44.997030,0> translate<21.000000,-1.535000,56.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.500000,-1.535000,61.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.500000,-1.535000,59.000000>}
box{<0,0,-0.012700><2.828427,0.035000,0.012700> rotate<0,44.997030,0> translate<22.500000,-1.535000,61.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.385000,0.000000,62.383200>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.500000,0.000000,62.500000>}
box{<0,0,-0.012700><0.163912,0.035000,0.012700> rotate<0,-45.441912,0> translate<24.385000,0.000000,62.383200> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.500000,0.000000,63.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.500000,0.000000,62.500000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<24.500000,0.000000,62.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.385000,0.000000,72.136800>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.500000,0.000000,72.000000>}
box{<0,0,-0.012700><0.178716,0.035000,0.012700> rotate<0,49.944842,0> translate<24.385000,0.000000,72.136800> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.500000,0.000000,71.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.500000,0.000000,72.000000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,90.000000,0> translate<24.500000,0.000000,72.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.000000,-1.535000,28.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<25.000000,-1.535000,27.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,44.997030,0> translate<24.000000,-1.535000,28.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.500000,0.000000,42.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<25.000000,0.000000,42.500000>}
box{<0,0,-0.012700><1.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<23.500000,0.000000,42.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<25.000000,0.000000,41.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<25.000000,0.000000,42.500000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,90.000000,0> translate<25.000000,0.000000,42.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<12.500000,0.000000,75.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<25.000000,0.000000,75.000000>}
box{<0,0,-0.012700><12.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<12.500000,0.000000,75.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<25.000000,0.000000,72.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<25.000000,0.000000,75.000000>}
box{<0,0,-0.012700><2.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<25.000000,0.000000,75.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<25.000000,0.000000,62.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<25.020000,0.000000,62.383200>}
box{<0,0,-0.012700><0.118500,0.035000,0.012700> rotate<0,80.278016,0> translate<25.000000,0.000000,62.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<25.000000,0.000000,72.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<25.020000,0.000000,72.136800>}
box{<0,0,-0.012700><0.363750,0.035000,0.012700> rotate<0,86.842398,0> translate<25.000000,0.000000,72.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.500000,0.000000,40.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<25.500000,0.000000,40.000000>}
box{<0,0,-0.012700><2.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<23.500000,0.000000,40.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.500000,0.000000,43.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<25.500000,0.000000,43.500000>}
box{<0,0,-0.012700><2.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<23.500000,0.000000,43.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<25.500000,0.000000,40.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<25.500000,0.000000,43.500000>}
box{<0,0,-0.012700><3.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<25.500000,0.000000,43.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<25.000000,0.000000,62.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<25.500000,0.000000,63.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,-44.997030,0> translate<25.000000,0.000000,62.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<12.500000,0.000000,75.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<25.500000,0.000000,75.500000>}
box{<0,0,-0.012700><13.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<12.500000,0.000000,75.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<25.500000,0.000000,63.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<25.500000,0.000000,75.500000>}
box{<0,0,-0.012700><12.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<25.500000,0.000000,75.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.500000,-1.535000,63.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<26.000000,-1.535000,65.000000>}
box{<0,0,-0.012700><2.121320,0.035000,0.012700> rotate<0,-44.997030,0> translate<24.500000,-1.535000,63.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<20.500000,-1.535000,67.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<26.000000,-1.535000,73.000000>}
box{<0,0,-0.012700><7.778175,0.035000,0.012700> rotate<0,-44.997030,0> translate<20.500000,-1.535000,67.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<13.000000,-1.535000,52.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<27.000000,-1.535000,38.500000>}
box{<0,0,-0.012700><19.798990,0.035000,0.012700> rotate<0,44.997030,0> translate<13.000000,-1.535000,52.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<20.500000,0.000000,14.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<28.000000,0.000000,14.000000>}
box{<0,0,-0.012700><7.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<20.500000,0.000000,14.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<25.000000,-1.535000,41.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<28.000000,-1.535000,38.500000>}
box{<0,0,-0.012700><4.242641,0.035000,0.012700> rotate<0,44.997030,0> translate<25.000000,-1.535000,41.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.500000,0.000000,39.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<28.000000,0.000000,39.000000>}
box{<0,0,-0.012700><4.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<23.500000,0.000000,39.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.500000,-1.535000,65.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<28.000000,-1.535000,59.500000>}
box{<0,0,-0.012700><7.778175,0.035000,0.012700> rotate<0,44.997030,0> translate<22.500000,-1.535000,65.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.500000,-1.535000,71.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<28.500000,-1.535000,67.000000>}
box{<0,0,-0.012700><5.656854,0.035000,0.012700> rotate<0,44.997030,0> translate<24.500000,-1.535000,71.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<21.500000,0.000000,15.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<29.000000,0.000000,15.500000>}
box{<0,0,-0.012700><7.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<21.500000,0.000000,15.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<29.000000,0.000000,25.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<29.000000,0.000000,15.500000>}
box{<0,0,-0.012700><10.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<29.000000,0.000000,15.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<27.000000,0.000000,38.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<29.500000,0.000000,38.500000>}
box{<0,0,-0.012700><2.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<27.000000,0.000000,38.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<25.500000,0.000000,40.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<29.500000,0.000000,40.000000>}
box{<0,0,-0.012700><4.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<25.500000,0.000000,40.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.500000,0.000000,49.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<29.500000,0.000000,42.500000>}
box{<0,0,-0.012700><9.899495,0.035000,0.012700> rotate<0,44.997030,0> translate<22.500000,0.000000,49.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<29.500000,0.000000,38.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<29.633400,0.000000,38.710000>}
box{<0,0,-0.012700><0.248788,0.035000,0.012700> rotate<0,-57.570932,0> translate<29.500000,0.000000,38.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<29.500000,0.000000,40.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<29.633400,0.000000,39.980000>}
box{<0,0,-0.012700><0.134891,0.035000,0.012700> rotate<0,8.526002,0> translate<29.500000,0.000000,40.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<29.500000,0.000000,42.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<29.633400,0.000000,42.520000>}
box{<0,0,-0.012700><0.134891,0.035000,0.012700> rotate<0,-8.526002,0> translate<29.500000,0.000000,42.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<29.633400,0.000000,37.440000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<30.000000,0.000000,37.500000>}
box{<0,0,-0.012700><0.371478,0.035000,0.012700> rotate<0,-9.294356,0> translate<29.633400,0.000000,37.440000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<29.633400,0.000000,39.980000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<30.000000,0.000000,40.000000>}
box{<0,0,-0.012700><0.367145,0.035000,0.012700> rotate<0,-3.122491,0> translate<29.633400,0.000000,39.980000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<28.000000,-1.535000,39.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<30.000000,-1.535000,41.000000>}
box{<0,0,-0.012700><2.828427,0.035000,0.012700> rotate<0,-44.997030,0> translate<28.000000,-1.535000,39.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<29.633400,0.000000,41.250000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<30.000000,0.000000,41.500000>}
box{<0,0,-0.012700><0.443729,0.035000,0.012700> rotate<0,-34.289463,0> translate<29.633400,0.000000,41.250000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<29.633400,0.000000,43.790000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<30.000000,0.000000,43.500000>}
box{<0,0,-0.012700><0.467435,0.035000,0.012700> rotate<0,38.343331,0> translate<29.633400,0.000000,43.790000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<29.633400,0.000000,45.060000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<30.000000,0.000000,45.000000>}
box{<0,0,-0.012700><0.371478,0.035000,0.012700> rotate<0,9.294356,0> translate<29.633400,0.000000,45.060000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<28.000000,0.000000,14.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<30.500000,0.000000,16.500000>}
box{<0,0,-0.012700><3.535534,0.035000,0.012700> rotate<0,-44.997030,0> translate<28.000000,0.000000,14.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<30.500000,0.000000,22.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<30.500000,0.000000,16.500000>}
box{<0,0,-0.012700><5.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<30.500000,0.000000,16.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<13.000000,-1.535000,53.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<30.500000,-1.535000,35.500000>}
box{<0,0,-0.012700><24.748737,0.035000,0.012700> rotate<0,44.997030,0> translate<13.000000,-1.535000,53.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.500000,-1.535000,20.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.000000,-1.535000,20.500000>}
box{<0,0,-0.012700><6.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<24.500000,-1.535000,20.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.000000,-1.535000,21.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.000000,-1.535000,21.500000>}
box{<0,0,-0.012700><7.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<24.000000,-1.535000,21.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.000000,-1.535000,22.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.000000,-1.535000,22.000000>}
box{<0,0,-0.012700><7.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<24.000000,-1.535000,22.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.000000,-1.535000,26.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.000000,-1.535000,26.500000>}
box{<0,0,-0.012700><7.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<24.000000,-1.535000,26.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<25.000000,-1.535000,27.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.000000,-1.535000,27.000000>}
box{<0,0,-0.012700><6.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<25.000000,-1.535000,27.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<29.000000,0.000000,25.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.000000,0.000000,27.500000>}
box{<0,0,-0.012700><2.828427,0.035000,0.012700> rotate<0,-44.997030,0> translate<29.000000,0.000000,25.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.000000,0.000000,27.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.000000,0.000000,31.500000>}
box{<0,0,-0.012700><4.000000,0.035000,0.012700> rotate<0,90.000000,0> translate<31.000000,0.000000,31.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<30.000000,0.000000,41.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.000000,0.000000,41.500000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<30.000000,0.000000,41.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<30.500000,0.000000,16.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.500000,0.000000,16.500000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<30.500000,0.000000,16.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.500000,0.000000,14.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.500000,0.000000,16.500000>}
box{<0,0,-0.012700><2.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<31.500000,0.000000,16.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.000000,0.000000,21.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.500000,0.000000,21.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<31.000000,0.000000,21.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.000000,0.000000,22.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.500000,0.000000,22.000000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<31.000000,0.000000,22.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.000000,0.000000,26.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.500000,0.000000,26.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<31.000000,0.000000,26.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.000000,0.000000,27.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.500000,0.000000,27.000000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<31.000000,0.000000,27.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.000000,0.000000,27.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.500000,0.000000,28.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,-44.997030,0> translate<31.000000,0.000000,27.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.500000,0.000000,31.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.500000,0.000000,28.500000>}
box{<0,0,-0.012700><3.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<31.500000,0.000000,28.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<30.000000,0.000000,40.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.500000,0.000000,41.500000>}
box{<0,0,-0.012700><2.121320,0.035000,0.012700> rotate<0,-44.997030,0> translate<30.000000,0.000000,40.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.000000,-1.535000,41.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.500000,-1.535000,42.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,-44.997030,0> translate<31.000000,-1.535000,41.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<30.000000,0.000000,43.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.500000,0.000000,43.500000>}
box{<0,0,-0.012700><1.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<30.000000,0.000000,43.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.500000,0.000000,41.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.500000,0.000000,43.500000>}
box{<0,0,-0.012700><2.000000,0.035000,0.012700> rotate<0,90.000000,0> translate<31.500000,0.000000,43.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.500000,0.000000,43.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.500000,0.000000,45.000000>}
box{<0,0,-0.012700><1.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<31.500000,0.000000,45.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.500000,0.000000,16.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.000000,0.000000,16.500000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<31.500000,0.000000,16.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.000000,0.000000,20.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.000000,0.000000,19.500000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,44.997030,0> translate<31.000000,0.000000,20.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.000000,-1.535000,20.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.000000,-1.535000,19.500000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,44.997030,0> translate<31.000000,-1.535000,20.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.500000,0.000000,21.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.000000,0.000000,21.000000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<31.500000,0.000000,21.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.500000,0.000000,22.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.000000,0.000000,21.500000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<31.500000,0.000000,22.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<30.500000,0.000000,22.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.000000,0.000000,23.500000>}
box{<0,0,-0.012700><2.121320,0.035000,0.012700> rotate<0,-44.997030,0> translate<30.500000,0.000000,22.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.500000,0.000000,26.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.000000,0.000000,26.000000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<31.500000,0.000000,26.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.500000,0.000000,27.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.000000,0.000000,26.500000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<31.500000,0.000000,27.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.500000,0.000000,28.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.000000,0.000000,28.000000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<31.500000,0.000000,28.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.500000,0.000000,28.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.000000,0.000000,28.500000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<31.500000,0.000000,28.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.000000,0.000000,16.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.286800,0.000000,16.430000>}
box{<0,0,-0.012700><0.295219,0.035000,0.012700> rotate<0,13.715253,0> translate<32.000000,0.000000,16.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.000000,0.000000,19.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.286800,0.000000,19.605000>}
box{<0,0,-0.012700><0.305417,0.035000,0.012700> rotate<0,-20.106795,0> translate<32.000000,0.000000,19.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.000000,0.000000,21.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.286800,0.000000,20.875000>}
box{<0,0,-0.012700><0.312857,0.035000,0.012700> rotate<0,23.548127,0> translate<32.000000,0.000000,21.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.000000,0.000000,21.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.286800,0.000000,21.510000>}
box{<0,0,-0.012700><0.286974,0.035000,0.012700> rotate<0,-1.996820,0> translate<32.000000,0.000000,21.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.000000,0.000000,23.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.286800,0.000000,23.415000>}
box{<0,0,-0.012700><0.299131,0.035000,0.012700> rotate<0,16.507353,0> translate<32.000000,0.000000,23.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.000000,0.000000,26.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.286800,0.000000,25.955000>}
box{<0,0,-0.012700><0.290309,0.035000,0.012700> rotate<0,8.916632,0> translate<32.000000,0.000000,26.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.000000,0.000000,26.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.286800,0.000000,26.590000>}
box{<0,0,-0.012700><0.300590,0.035000,0.012700> rotate<0,-17.421100,0> translate<32.000000,0.000000,26.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.000000,0.000000,28.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.286800,0.000000,27.860000>}
box{<0,0,-0.012700><0.319146,0.035000,0.012700> rotate<0,26.017371,0> translate<32.000000,0.000000,28.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.000000,0.000000,28.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.286800,0.000000,28.495000>}
box{<0,0,-0.012700><0.286844,0.035000,0.012700> rotate<0,0.998713,0> translate<32.000000,0.000000,28.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.286800,0.000000,14.525000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.500000,0.000000,14.500000>}
box{<0,0,-0.012700><0.214661,0.035000,0.012700> rotate<0,6.687565,0> translate<32.286800,0.000000,14.525000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.286800,0.000000,17.065000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.500000,0.000000,17.000000>}
box{<0,0,-0.012700><0.222888,0.035000,0.012700> rotate<0,16.954194,0> translate<32.286800,0.000000,17.065000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.286800,0.000000,18.970000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.500000,0.000000,19.000000>}
box{<0,0,-0.012700><0.215300,0.035000,0.012700> rotate<0,-8.009141,0> translate<32.286800,0.000000,18.970000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.000000,-1.535000,21.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.500000,-1.535000,20.000000>}
box{<0,0,-0.012700><2.121320,0.035000,0.012700> rotate<0,44.997030,0> translate<31.000000,-1.535000,21.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.286800,0.000000,22.145000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.500000,0.000000,22.000000>}
box{<0,0,-0.012700><0.257836,0.035000,0.012700> rotate<0,34.217854,0> translate<32.286800,0.000000,22.145000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.286800,0.000000,24.050000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.500000,0.000000,24.000000>}
box{<0,0,-0.012700><0.218985,0.035000,0.012700> rotate<0,13.197700,0> translate<32.286800,0.000000,24.050000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.286800,0.000000,29.130000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.500000,0.000000,29.000000>}
box{<0,0,-0.012700><0.249708,0.035000,0.012700> rotate<0,31.370935,0> translate<32.286800,0.000000,29.130000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.500000,0.000000,29.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<33.000000,0.000000,29.000000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<32.500000,0.000000,29.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.500000,-1.535000,19.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<33.500000,-1.535000,19.000000>}
box{<0,0,-0.012700><9.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<24.500000,-1.535000,19.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.500000,0.000000,19.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<33.500000,0.000000,19.000000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<32.500000,0.000000,19.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.500000,0.000000,17.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<34.000000,0.000000,17.000000>}
box{<0,0,-0.012700><1.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<32.500000,0.000000,17.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<34.000000,0.000000,20.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<34.000000,0.000000,17.000000>}
box{<0,0,-0.012700><3.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<34.000000,0.000000,17.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.500000,0.000000,22.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<34.000000,0.000000,22.000000>}
box{<0,0,-0.012700><1.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<32.500000,0.000000,22.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<34.000000,0.000000,22.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<34.000000,0.000000,22.000000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<34.000000,0.000000,22.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.500000,0.000000,24.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<34.000000,0.000000,24.000000>}
box{<0,0,-0.012700><1.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<32.500000,0.000000,24.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<30.000000,0.000000,37.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<34.000000,0.000000,41.500000>}
box{<0,0,-0.012700><5.656854,0.035000,0.012700> rotate<0,-44.997030,0> translate<30.000000,0.000000,37.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.500000,0.000000,14.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<34.500000,0.000000,14.500000>}
box{<0,0,-0.012700><2.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<32.500000,0.000000,14.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<34.500000,0.000000,27.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<34.500000,0.000000,14.500000>}
box{<0,0,-0.012700><13.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<34.500000,0.000000,14.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<33.000000,0.000000,29.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<34.500000,0.000000,27.500000>}
box{<0,0,-0.012700><2.121320,0.035000,0.012700> rotate<0,44.997030,0> translate<33.000000,0.000000,29.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.000000,-1.535000,27.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<34.500000,-1.535000,30.500000>}
box{<0,0,-0.012700><4.949747,0.035000,0.012700> rotate<0,-44.997030,0> translate<31.000000,-1.535000,27.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.000000,0.000000,31.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<34.500000,0.000000,35.000000>}
box{<0,0,-0.012700><4.949747,0.035000,0.012700> rotate<0,-44.997030,0> translate<31.000000,0.000000,31.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<34.500000,0.000000,61.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<34.500000,0.000000,52.000000>}
box{<0,0,-0.012700><9.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<34.500000,0.000000,52.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<34.000000,-1.535000,20.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<35.000000,-1.535000,21.500000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,-44.997030,0> translate<34.000000,-1.535000,20.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<30.000000,0.000000,45.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<35.000000,0.000000,50.000000>}
box{<0,0,-0.012700><7.071068,0.035000,0.012700> rotate<0,-44.997030,0> translate<30.000000,0.000000,45.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<35.000000,0.000000,53.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<35.000000,0.000000,52.500000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<35.000000,0.000000,52.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<17.500000,-1.535000,58.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<35.000000,-1.535000,58.500000>}
box{<0,0,-0.012700><17.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<17.500000,-1.535000,58.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<35.000000,0.000000,55.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<35.000000,0.000000,58.500000>}
box{<0,0,-0.012700><3.000000,0.035000,0.012700> rotate<0,90.000000,0> translate<35.000000,0.000000,58.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<34.000000,-1.535000,24.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<35.500000,-1.535000,25.500000>}
box{<0,0,-0.012700><2.121320,0.035000,0.012700> rotate<0,-44.997030,0> translate<34.000000,-1.535000,24.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<30.500000,-1.535000,35.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<35.500000,-1.535000,35.500000>}
box{<0,0,-0.012700><5.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<30.500000,-1.535000,35.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.500000,0.000000,31.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<35.500000,0.000000,35.500000>}
box{<0,0,-0.012700><5.656854,0.035000,0.012700> rotate<0,-44.997030,0> translate<31.500000,0.000000,31.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<35.000000,0.000000,53.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<35.500000,0.000000,54.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,-44.997030,0> translate<35.000000,0.000000,53.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.000000,0.000000,34.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.000000,0.000000,48.000000>}
box{<0,0,-0.012700><13.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<36.000000,0.000000,48.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.500000,0.000000,45.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.000000,0.000000,49.500000>}
box{<0,0,-0.012700><6.363961,0.035000,0.012700> rotate<0,-44.997030,0> translate<31.500000,0.000000,45.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.500000,0.000000,51.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.000000,0.000000,51.000000>}
box{<0,0,-0.012700><12.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<23.500000,0.000000,51.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<34.500000,0.000000,52.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.000000,0.000000,52.000000>}
box{<0,0,-0.012700><1.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<34.500000,0.000000,52.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<35.000000,0.000000,55.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.000000,0.000000,54.500000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,44.997030,0> translate<35.000000,0.000000,55.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.000000,0.000000,48.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.366600,0.000000,48.240000>}
box{<0,0,-0.012700><0.438173,0.035000,0.012700> rotate<0,-33.209153,0> translate<36.000000,0.000000,48.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.000000,0.000000,49.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.366600,0.000000,49.510000>}
box{<0,0,-0.012700><0.366736,0.035000,0.012700> rotate<0,-1.562406,0> translate<36.000000,0.000000,49.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.000000,0.000000,51.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.366600,0.000000,50.780000>}
box{<0,0,-0.012700><0.427546,0.035000,0.012700> rotate<0,30.966309,0> translate<36.000000,0.000000,51.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.000000,0.000000,52.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.366600,0.000000,52.050000>}
box{<0,0,-0.012700><0.369994,0.035000,0.012700> rotate<0,-7.766048,0> translate<36.000000,0.000000,52.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.000000,0.000000,54.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.366600,0.000000,54.590000>}
box{<0,0,-0.012700><0.377486,0.035000,0.012700> rotate<0,-13.792369,0> translate<36.000000,0.000000,54.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.500000,0.000000,14.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.500000,0.000000,14.000000>}
box{<0,0,-0.012700><5.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<31.500000,0.000000,14.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.500000,0.000000,39.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.500000,0.000000,14.000000>}
box{<0,0,-0.012700><25.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<36.500000,0.000000,14.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.366600,0.000000,48.240000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.500000,0.000000,48.500000>}
box{<0,0,-0.012700><0.292225,0.035000,0.012700> rotate<0,-62.834540,0> translate<36.366600,0.000000,48.240000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.366600,0.000000,49.510000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.500000,0.000000,49.500000>}
box{<0,0,-0.012700><0.133774,0.035000,0.012700> rotate<0,4.286735,0> translate<36.366600,0.000000,49.510000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<21.000000,-1.535000,50.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.500000,-1.535000,50.000000>}
box{<0,0,-0.012700><15.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<21.000000,-1.535000,50.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.366600,0.000000,53.320000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.500000,0.000000,53.000000>}
box{<0,0,-0.012700><0.346692,0.035000,0.012700> rotate<0,67.365519,0> translate<36.366600,0.000000,53.320000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.366600,0.000000,55.860000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.500000,0.000000,56.000000>}
box{<0,0,-0.012700><0.193379,0.035000,0.012700> rotate<0,-46.379816,0> translate<36.366600,0.000000,55.860000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.500000,-1.535000,18.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<37.000000,-1.535000,18.500000>}
box{<0,0,-0.012700><12.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<24.500000,-1.535000,18.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<33.500000,-1.535000,19.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<37.000000,-1.535000,19.000000>}
box{<0,0,-0.012700><3.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<33.500000,-1.535000,19.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<35.000000,-1.535000,21.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<37.000000,-1.535000,21.500000>}
box{<0,0,-0.012700><2.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<35.000000,-1.535000,21.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<35.500000,-1.535000,35.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<37.500000,-1.535000,37.500000>}
box{<0,0,-0.012700><2.828427,0.035000,0.012700> rotate<0,-44.997030,0> translate<35.500000,-1.535000,35.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.500000,0.000000,48.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<37.500000,0.000000,48.500000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<36.500000,0.000000,48.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<35.000000,0.000000,50.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<37.500000,0.000000,50.000000>}
box{<0,0,-0.012700><2.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<35.000000,0.000000,50.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<37.500000,0.000000,52.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<37.500000,0.000000,50.000000>}
box{<0,0,-0.012700><2.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<37.500000,0.000000,50.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<35.000000,0.000000,52.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<37.500000,0.000000,52.500000>}
box{<0,0,-0.012700><2.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<35.000000,0.000000,52.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.500000,-1.535000,50.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<38.000000,-1.535000,48.500000>}
box{<0,0,-0.012700><2.121320,0.035000,0.012700> rotate<0,44.997030,0> translate<36.500000,-1.535000,50.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<37.500000,0.000000,48.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<38.000000,0.000000,49.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,-44.997030,0> translate<37.500000,0.000000,48.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.500000,0.000000,49.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<38.000000,0.000000,49.500000>}
box{<0,0,-0.012700><1.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<36.500000,0.000000,49.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.500000,0.000000,53.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<38.000000,0.000000,53.000000>}
box{<0,0,-0.012700><1.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<36.500000,0.000000,53.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<38.000000,0.000000,49.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<38.000000,0.000000,53.000000>}
box{<0,0,-0.012700><3.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<38.000000,0.000000,53.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<38.000000,0.000000,53.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<38.000000,0.000000,53.500000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<38.000000,0.000000,53.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<37.000000,-1.535000,19.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<39.500000,-1.535000,16.500000>}
box{<0,0,-0.012700><3.535534,0.035000,0.012700> rotate<0,44.997030,0> translate<37.000000,-1.535000,19.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.500000,0.000000,56.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<40.500000,0.000000,56.000000>}
box{<0,0,-0.012700><4.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<36.500000,0.000000,56.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.500000,-1.535000,53.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<41.000000,-1.535000,53.000000>}
box{<0,0,-0.012700><16.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<24.500000,-1.535000,53.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<35.500000,0.000000,54.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<41.000000,0.000000,54.000000>}
box{<0,0,-0.012700><5.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<35.500000,0.000000,54.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<41.000000,0.000000,56.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<41.000000,0.000000,54.000000>}
box{<0,0,-0.012700><2.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<41.000000,0.000000,54.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<41.000000,0.000000,53.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<42.000000,0.000000,52.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,44.997030,0> translate<41.000000,0.000000,53.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<38.000000,0.000000,48.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<42.500000,0.000000,48.500000>}
box{<0,0,-0.012700><4.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<38.000000,0.000000,48.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<38.000000,0.000000,49.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<42.500000,0.000000,49.500000>}
box{<0,0,-0.012700><4.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<38.000000,0.000000,49.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<42.000000,0.000000,52.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<42.500000,0.000000,52.000000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<42.000000,0.000000,52.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<38.000000,0.000000,53.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<42.500000,0.000000,53.500000>}
box{<0,0,-0.012700><4.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<38.000000,0.000000,53.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<42.500000,0.000000,48.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<42.513400,0.000000,48.240000>}
box{<0,0,-0.012700><0.260345,0.035000,0.012700> rotate<0,87.043929,0> translate<42.500000,0.000000,48.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<42.500000,0.000000,49.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<42.513400,0.000000,49.510000>}
box{<0,0,-0.012700><0.016720,0.035000,0.012700> rotate<0,-36.730402,0> translate<42.500000,0.000000,49.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<42.500000,0.000000,52.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<42.513400,0.000000,52.050000>}
box{<0,0,-0.012700><0.051764,0.035000,0.012700> rotate<0,-74.992334,0> translate<42.500000,0.000000,52.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<42.500000,0.000000,53.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<42.513400,0.000000,53.320000>}
box{<0,0,-0.012700><0.180498,0.035000,0.012700> rotate<0,85.736842,0> translate<42.500000,0.000000,53.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<42.513400,0.000000,50.780000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<43.000000,0.000000,50.500000>}
box{<0,0,-0.012700><0.561409,0.035000,0.012700> rotate<0,29.915065,0> translate<42.513400,0.000000,50.780000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<42.513400,0.000000,54.590000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<43.000000,0.000000,54.500000>}
box{<0,0,-0.012700><0.494853,0.035000,0.012700> rotate<0,10.478136,0> translate<42.513400,0.000000,54.590000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<42.513400,0.000000,55.860000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<43.000000,0.000000,56.000000>}
box{<0,0,-0.012700><0.506339,0.035000,0.012700> rotate<0,-16.050031,0> translate<42.513400,0.000000,55.860000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<41.000000,0.000000,54.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<43.500000,0.000000,54.000000>}
box{<0,0,-0.012700><2.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<41.000000,0.000000,54.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<43.000000,0.000000,50.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<45.000000,0.000000,50.500000>}
box{<0,0,-0.012700><2.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<43.000000,0.000000,50.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<38.000000,0.000000,49.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<45.500000,0.000000,49.000000>}
box{<0,0,-0.012700><7.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<38.000000,0.000000,49.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<45.500000,0.000000,52.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<45.500000,0.000000,49.000000>}
box{<0,0,-0.012700><3.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<45.500000,0.000000,49.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<43.500000,0.000000,54.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<45.500000,0.000000,52.000000>}
box{<0,0,-0.012700><2.828427,0.035000,0.012700> rotate<0,44.997030,0> translate<43.500000,0.000000,54.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<28.000000,-1.535000,59.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<47.000000,-1.535000,59.500000>}
box{<0,0,-0.012700><19.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<28.000000,-1.535000,59.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<43.000000,0.000000,54.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<47.500000,0.000000,54.500000>}
box{<0,0,-0.012700><4.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<43.000000,0.000000,54.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.500000,0.000000,39.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<48.000000,0.000000,51.000000>}
box{<0,0,-0.012700><16.263456,0.035000,0.012700> rotate<0,-44.997030,0> translate<36.500000,0.000000,39.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<48.000000,0.000000,56.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<48.000000,0.000000,51.000000>}
box{<0,0,-0.012700><5.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<48.000000,0.000000,51.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<47.500000,-1.535000,54.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<48.000000,-1.535000,55.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,-44.997030,0> translate<47.500000,-1.535000,54.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<43.000000,0.000000,56.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<48.000000,0.000000,56.000000>}
box{<0,0,-0.012700><5.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<43.000000,0.000000,56.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<41.000000,0.000000,56.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<48.000000,0.000000,63.000000>}
box{<0,0,-0.012700><9.899495,0.035000,0.012700> rotate<0,-44.997030,0> translate<41.000000,0.000000,56.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<48.000000,0.000000,63.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<48.000000,0.000000,73.500000>}
box{<0,0,-0.012700><10.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<48.000000,0.000000,73.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<21.000000,-1.535000,66.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<48.500000,-1.535000,66.500000>}
box{<0,0,-0.012700><27.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<21.000000,-1.535000,66.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<47.000000,0.000000,59.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<49.000000,0.000000,57.500000>}
box{<0,0,-0.012700><2.828427,0.035000,0.012700> rotate<0,44.997030,0> translate<47.000000,0.000000,59.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<48.000000,0.000000,63.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<49.000000,0.000000,64.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,-44.997030,0> translate<48.000000,0.000000,63.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<48.500000,0.000000,66.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<49.000000,0.000000,67.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,-44.997030,0> translate<48.500000,0.000000,66.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<49.000000,0.000000,68.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<49.000000,0.000000,67.000000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<49.000000,0.000000,67.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<48.000000,0.000000,73.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<49.000000,0.000000,74.500000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,-44.997030,0> translate<48.000000,0.000000,73.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<49.000000,0.000000,57.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<49.180000,0.000000,57.456600>}
box{<0,0,-0.012700><0.185158,0.035000,0.012700> rotate<0,13.555018,0> translate<49.000000,0.000000,57.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<49.000000,0.000000,64.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<49.180000,0.000000,63.603400>}
box{<0,0,-0.012700><0.435536,0.035000,0.012700> rotate<0,65.584379,0> translate<49.000000,0.000000,64.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<49.000000,0.000000,68.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<49.230000,0.000000,68.456600>}
box{<0,0,-0.012700><0.511257,0.035000,0.012700> rotate<0,-63.260370,0> translate<49.000000,0.000000,68.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<49.000000,0.000000,74.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<49.230000,0.000000,74.603400>}
box{<0,0,-0.012700><0.252174,0.035000,0.012700> rotate<0,-24.205428,0> translate<49.000000,0.000000,74.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<37.000000,0.000000,21.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<50.500000,0.000000,35.000000>}
box{<0,0,-0.012700><19.091883,0.035000,0.012700> rotate<0,-44.997030,0> translate<37.000000,0.000000,21.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<50.500000,0.000000,46.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<50.500000,0.000000,35.000000>}
box{<0,0,-0.012700><11.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<50.500000,0.000000,35.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<50.450000,0.000000,57.456600>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<50.500000,0.000000,57.500000>}
box{<0,0,-0.012700><0.066208,0.035000,0.012700> rotate<0,-40.955278,0> translate<50.450000,0.000000,57.456600> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<50.500000,0.000000,60.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<50.500000,0.000000,57.500000>}
box{<0,0,-0.012700><3.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<50.500000,0.000000,57.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<50.500000,0.000000,63.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<50.500000,0.000000,60.500000>}
box{<0,0,-0.012700><3.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<50.500000,0.000000,60.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<50.450000,0.000000,63.603400>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<50.500000,0.000000,63.500000>}
box{<0,0,-0.012700><0.114855,0.035000,0.012700> rotate<0,64.189257,0> translate<50.450000,0.000000,63.603400> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<50.450000,0.000000,63.603400>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<50.500000,0.000000,64.000000>}
box{<0,0,-0.012700><0.399739,0.035000,0.012700> rotate<0,-82.809072,0> translate<50.450000,0.000000,63.603400> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<50.500000,0.000000,64.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<50.500000,0.000000,68.456600>}
box{<0,0,-0.012700><4.456600,0.035000,0.012700> rotate<0,90.000000,0> translate<50.500000,0.000000,68.456600> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<50.500000,0.000000,68.456600>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<50.500000,0.000000,74.603400>}
box{<0,0,-0.012700><6.146800,0.035000,0.012700> rotate<0,90.000000,0> translate<50.500000,0.000000,74.603400> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<34.500000,0.000000,61.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<50.500000,0.000000,77.500000>}
box{<0,0,-0.012700><22.627417,0.035000,0.012700> rotate<0,-44.997030,0> translate<34.500000,0.000000,61.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<51.000000,0.000000,46.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<51.000000,0.000000,44.500000>}
box{<0,0,-0.012700><1.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<51.000000,0.000000,44.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<26.000000,-1.535000,65.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<51.000000,-1.535000,65.000000>}
box{<0,0,-0.012700><25.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<26.000000,-1.535000,65.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<26.000000,-1.535000,73.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<51.000000,-1.535000,73.000000>}
box{<0,0,-0.012700><25.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<26.000000,-1.535000,73.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<21.000000,-1.535000,73.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<51.000000,-1.535000,73.500000>}
box{<0,0,-0.012700><30.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<21.000000,-1.535000,73.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<37.000000,0.000000,18.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<51.500000,0.000000,33.000000>}
box{<0,0,-0.012700><20.506097,0.035000,0.012700> rotate<0,-44.997030,0> translate<37.000000,0.000000,18.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<51.500000,0.000000,42.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<51.500000,0.000000,33.000000>}
box{<0,0,-0.012700><9.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<51.500000,0.000000,33.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<50.500000,0.000000,46.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<51.500000,0.000000,47.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,-44.997030,0> translate<50.500000,0.000000,46.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<51.000000,0.000000,65.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<51.500000,0.000000,64.500000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<51.000000,0.000000,65.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<51.500000,0.000000,64.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<51.500000,0.000000,64.500000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<51.500000,0.000000,64.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<51.000000,0.000000,73.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<51.500000,0.000000,73.500000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,-44.997030,0> translate<51.000000,0.000000,73.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<51.500000,0.000000,74.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<51.500000,0.000000,73.500000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<51.500000,0.000000,73.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<51.500000,0.000000,64.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<51.720000,0.000000,63.603400>}
box{<0,0,-0.012700><0.453532,0.035000,0.012700> rotate<0,60.978183,0> translate<51.500000,0.000000,64.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<51.500000,0.000000,74.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<51.770000,0.000000,74.603400>}
box{<0,0,-0.012700><0.289122,0.035000,0.012700> rotate<0,-20.953606,0> translate<51.500000,0.000000,74.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<51.720000,0.000000,57.456600>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<52.000000,0.000000,57.000000>}
box{<0,0,-0.012700><0.535615,0.035000,0.012700> rotate<0,58.478340,0> translate<51.720000,0.000000,57.456600> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.500000,-1.535000,59.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<52.000000,-1.535000,59.000000>}
box{<0,0,-0.012700><27.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<24.500000,-1.535000,59.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<51.770000,0.000000,68.456600>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<52.000000,0.000000,68.500000>}
box{<0,0,-0.012700><0.234059,0.035000,0.012700> rotate<0,-10.685115,0> translate<51.770000,0.000000,68.456600> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<51.500000,0.000000,42.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<52.500000,0.000000,43.500000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,-44.997030,0> translate<51.500000,0.000000,42.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<51.000000,0.000000,44.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<52.500000,0.000000,44.500000>}
box{<0,0,-0.012700><1.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<51.000000,0.000000,44.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<51.500000,0.000000,47.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<52.500000,0.000000,47.000000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<51.500000,0.000000,47.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<48.000000,0.000000,56.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<52.500000,0.000000,56.000000>}
box{<0,0,-0.012700><4.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<48.000000,0.000000,56.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<52.500000,0.000000,55.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<52.500000,0.000000,56.000000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<52.500000,0.000000,56.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<52.000000,0.000000,68.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<52.500000,0.000000,69.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,-44.997030,0> translate<52.000000,0.000000,68.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<52.500000,0.000000,75.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<52.500000,0.000000,69.000000>}
box{<0,0,-0.012700><6.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<52.500000,0.000000,69.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<22.000000,-1.535000,74.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<52.500000,-1.535000,74.000000>}
box{<0,0,-0.012700><30.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<22.000000,-1.535000,74.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<52.500000,0.000000,43.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<52.766600,0.000000,43.210000>}
box{<0,0,-0.012700><0.393923,0.035000,0.012700> rotate<0,47.404223,0> translate<52.500000,0.000000,43.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<52.500000,0.000000,44.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<52.766600,0.000000,44.480000>}
box{<0,0,-0.012700><0.267349,0.035000,0.012700> rotate<0,4.289939,0> translate<52.500000,0.000000,44.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<52.500000,0.000000,47.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<52.766600,0.000000,47.020000>}
box{<0,0,-0.012700><0.267349,0.035000,0.012700> rotate<0,-4.289939,0> translate<52.500000,0.000000,47.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<52.766600,0.000000,40.670000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<53.000000,0.000000,40.500000>}
box{<0,0,-0.012700><0.288748,0.035000,0.012700> rotate<0,36.065841,0> translate<52.766600,0.000000,40.670000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<52.766600,0.000000,41.940000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<53.000000,0.000000,42.000000>}
box{<0,0,-0.012700><0.240989,0.035000,0.012700> rotate<0,-14.415874,0> translate<52.766600,0.000000,41.940000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<45.000000,-1.535000,50.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<53.000000,-1.535000,42.500000>}
box{<0,0,-0.012700><11.313708,0.035000,0.012700> rotate<0,44.997030,0> translate<45.000000,-1.535000,50.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<52.766600,0.000000,45.750000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<53.000000,0.000000,45.500000>}
box{<0,0,-0.012700><0.342017,0.035000,0.012700> rotate<0,46.963670,0> translate<52.766600,0.000000,45.750000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<52.766600,0.000000,48.290000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<53.000000,0.000000,48.500000>}
box{<0,0,-0.012700><0.313967,0.035000,0.012700> rotate<0,-41.976303,0> translate<52.766600,0.000000,48.290000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<52.000000,0.000000,57.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<53.000000,0.000000,56.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,44.997030,0> translate<52.000000,0.000000,57.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<52.990000,0.000000,57.456600>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<53.000000,0.000000,57.500000>}
box{<0,0,-0.012700><0.044537,0.035000,0.012700> rotate<0,-77.019585,0> translate<52.990000,0.000000,57.456600> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<52.000000,0.000000,59.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<53.000000,0.000000,58.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,44.997030,0> translate<52.000000,0.000000,59.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<53.000000,0.000000,57.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<53.000000,0.000000,58.000000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<53.000000,0.000000,58.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<52.990000,0.000000,63.603400>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<53.000000,0.000000,64.000000>}
box{<0,0,-0.012700><0.396726,0.035000,0.012700> rotate<0,-88.549787,0> translate<52.990000,0.000000,63.603400> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<51.000000,-1.535000,73.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<53.000000,-1.535000,71.500000>}
box{<0,0,-0.012700><2.828427,0.035000,0.012700> rotate<0,44.997030,0> translate<51.000000,-1.535000,73.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<53.000000,0.000000,68.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<53.000000,0.000000,71.500000>}
box{<0,0,-0.012700><3.000000,0.035000,0.012700> rotate<0,90.000000,0> translate<53.000000,0.000000,71.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<53.000000,0.000000,68.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<53.040000,0.000000,68.456600>}
box{<0,0,-0.012700><0.059022,0.035000,0.012700> rotate<0,47.331383,0> translate<53.000000,0.000000,68.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<53.000000,0.000000,75.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<53.040000,0.000000,74.603400>}
box{<0,0,-0.012700><0.398612,0.035000,0.012700> rotate<0,84.235219,0> translate<53.000000,0.000000,75.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<40.500000,-1.535000,56.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<53.500000,-1.535000,43.000000>}
box{<0,0,-0.012700><18.384776,0.035000,0.012700> rotate<0,44.997030,0> translate<40.500000,-1.535000,56.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<53.000000,0.000000,42.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.000000,0.000000,42.000000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<53.000000,0.000000,42.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<53.000000,0.000000,45.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.000000,0.000000,45.500000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<53.000000,0.000000,45.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.000000,0.000000,42.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.000000,0.000000,45.500000>}
box{<0,0,-0.012700><3.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<54.000000,0.000000,45.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<53.000000,0.000000,64.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.000000,0.000000,65.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,-44.997030,0> translate<53.000000,0.000000,64.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<52.500000,0.000000,75.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.000000,0.000000,77.000000>}
box{<0,0,-0.012700><2.121320,0.035000,0.012700> rotate<0,-44.997030,0> translate<52.500000,0.000000,75.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.260000,0.000000,57.456600>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.500000,0.000000,57.500000>}
box{<0,0,-0.012700><0.243893,0.035000,0.012700> rotate<0,-10.249539,0> translate<54.260000,0.000000,57.456600> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.500000,0.000000,60.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.500000,0.000000,57.500000>}
box{<0,0,-0.012700><3.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<54.500000,0.000000,57.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<50.500000,0.000000,60.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.500000,0.000000,60.500000>}
box{<0,0,-0.012700><4.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<50.500000,0.000000,60.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.500000,0.000000,63.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.500000,0.000000,60.500000>}
box{<0,0,-0.012700><3.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<54.500000,0.000000,60.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.260000,0.000000,63.603400>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.500000,0.000000,63.500000>}
box{<0,0,-0.012700><0.261327,0.035000,0.012700> rotate<0,23.306450,0> translate<54.260000,0.000000,63.603400> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.260000,0.000000,63.603400>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.500000,0.000000,64.000000>}
box{<0,0,-0.012700><0.463564,0.035000,0.012700> rotate<0,-58.816152,0> translate<54.260000,0.000000,63.603400> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.000000,-1.535000,65.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.500000,-1.535000,65.500000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,-44.997030,0> translate<54.000000,-1.535000,65.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.310000,0.000000,68.456600>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.500000,0.000000,68.000000>}
box{<0,0,-0.012700><0.494554,0.035000,0.012700> rotate<0,67.402422,0> translate<54.310000,0.000000,68.456600> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.500000,0.000000,64.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.500000,0.000000,68.000000>}
box{<0,0,-0.012700><4.000000,0.035000,0.012700> rotate<0,90.000000,0> translate<54.500000,0.000000,68.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.310000,0.000000,68.456600>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.500000,0.000000,68.500000>}
box{<0,0,-0.012700><0.194894,0.035000,0.012700> rotate<0,-12.865964,0> translate<54.310000,0.000000,68.456600> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.310000,0.000000,74.603400>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.500000,0.000000,74.500000>}
box{<0,0,-0.012700><0.216314,0.035000,0.012700> rotate<0,28.553613,0> translate<54.310000,0.000000,74.603400> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.500000,0.000000,68.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.500000,0.000000,74.500000>}
box{<0,0,-0.012700><6.000000,0.035000,0.012700> rotate<0,90.000000,0> translate<54.500000,0.000000,74.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<52.500000,-1.535000,74.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.500000,-1.535000,76.000000>}
box{<0,0,-0.012700><2.828427,0.035000,0.012700> rotate<0,-44.997030,0> translate<52.500000,-1.535000,74.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<53.000000,0.000000,75.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.500000,0.000000,76.500000>}
box{<0,0,-0.012700><2.121320,0.035000,0.012700> rotate<0,-44.997030,0> translate<53.000000,0.000000,75.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<28.500000,-1.535000,67.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<55.000000,-1.535000,67.000000>}
box{<0,0,-0.012700><26.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<28.500000,-1.535000,67.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<51.000000,-1.535000,46.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<55.500000,-1.535000,50.500000>}
box{<0,0,-0.012700><6.363961,0.035000,0.012700> rotate<0,-44.997030,0> translate<51.000000,-1.535000,46.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<55.500000,0.000000,59.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<55.500000,0.000000,57.500000>}
box{<0,0,-0.012700><1.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<55.500000,0.000000,57.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<55.000000,0.000000,67.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<55.500000,0.000000,66.500000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<55.000000,0.000000,67.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<55.500000,0.000000,64.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<55.500000,0.000000,66.500000>}
box{<0,0,-0.012700><2.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<55.500000,0.000000,66.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<55.500000,0.000000,70.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<55.500000,0.000000,68.500000>}
box{<0,0,-0.012700><1.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<55.500000,0.000000,68.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.500000,0.000000,76.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<55.500000,0.000000,75.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,44.997030,0> translate<54.500000,0.000000,76.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<55.500000,0.000000,57.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<55.530000,0.000000,57.456600>}
box{<0,0,-0.012700><0.052759,0.035000,0.012700> rotate<0,55.342404,0> translate<55.500000,0.000000,57.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<55.500000,0.000000,64.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<55.530000,0.000000,63.603400>}
box{<0,0,-0.012700><0.397733,0.035000,0.012700> rotate<0,85.668561,0> translate<55.500000,0.000000,64.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<55.500000,0.000000,68.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<55.580000,0.000000,68.456600>}
box{<0,0,-0.012700><0.091014,0.035000,0.012700> rotate<0,28.477952,0> translate<55.500000,0.000000,68.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<55.500000,0.000000,75.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<55.580000,0.000000,74.603400>}
box{<0,0,-0.012700><0.404588,0.035000,0.012700> rotate<0,78.590452,0> translate<55.500000,0.000000,75.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<53.000000,0.000000,48.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<56.000000,0.000000,51.500000>}
box{<0,0,-0.012700><4.242641,0.035000,0.012700> rotate<0,-44.997030,0> translate<53.000000,0.000000,48.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<53.000000,0.000000,56.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<56.000000,0.000000,56.000000>}
box{<0,0,-0.012700><3.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<53.000000,0.000000,56.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<56.000000,0.000000,69.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<56.000000,0.000000,56.000000>}
box{<0,0,-0.012700><13.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<56.000000,0.000000,56.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<36.000000,-1.535000,34.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<56.500000,-1.535000,34.500000>}
box{<0,0,-0.012700><20.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<36.000000,-1.535000,34.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<53.000000,0.000000,40.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<56.500000,0.000000,37.000000>}
box{<0,0,-0.012700><4.949747,0.035000,0.012700> rotate<0,44.997030,0> translate<53.000000,0.000000,40.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<56.500000,0.000000,34.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<56.500000,0.000000,37.000000>}
box{<0,0,-0.012700><2.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<56.500000,0.000000,37.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<52.500000,0.000000,55.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<56.500000,0.000000,51.500000>}
box{<0,0,-0.012700><5.656854,0.035000,0.012700> rotate<0,44.997030,0> translate<52.500000,0.000000,55.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<56.500000,0.000000,51.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<56.500000,0.000000,57.000000>}
box{<0,0,-0.012700><5.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<56.500000,0.000000,57.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<56.000000,0.000000,69.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<56.500000,0.000000,70.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,-44.997030,0> translate<56.000000,0.000000,69.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<56.500000,0.000000,57.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<56.800000,0.000000,57.456600>}
box{<0,0,-0.012700><0.546336,0.035000,0.012700> rotate<0,-56.690135,0> translate<56.500000,0.000000,57.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.000000,0.000000,42.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<57.000000,0.000000,42.000000>}
box{<0,0,-0.012700><3.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<54.000000,0.000000,42.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<57.000000,0.000000,31.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<57.000000,0.000000,42.000000>}
box{<0,0,-0.012700><11.000000,0.035000,0.012700> rotate<0,90.000000,0> translate<57.000000,0.000000,42.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<57.000000,0.000000,42.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<57.000000,0.000000,44.000000>}
box{<0,0,-0.012700><2.000000,0.035000,0.012700> rotate<0,90.000000,0> translate<57.000000,0.000000,44.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<56.800000,0.000000,57.456600>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<57.000000,0.000000,57.500000>}
box{<0,0,-0.012700><0.204655,0.035000,0.012700> rotate<0,-12.242556,0> translate<56.800000,0.000000,57.456600> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<56.800000,0.000000,63.603400>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<57.000000,0.000000,64.000000>}
box{<0,0,-0.012700><0.444175,0.035000,0.012700> rotate<0,-63.234637,0> translate<56.800000,0.000000,63.603400> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<56.850000,0.000000,68.456600>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<57.000000,0.000000,68.000000>}
box{<0,0,-0.012700><0.480607,0.035000,0.012700> rotate<0,71.809127,0> translate<56.850000,0.000000,68.456600> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<56.850000,0.000000,74.603400>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<57.000000,0.000000,74.500000>}
box{<0,0,-0.012700><0.182186,0.035000,0.012700> rotate<0,34.577508,0> translate<56.850000,0.000000,74.603400> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<23.500000,-1.535000,33.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<57.500000,-1.535000,33.000000>}
box{<0,0,-0.012700><34.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<23.500000,-1.535000,33.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<57.500000,0.000000,43.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<57.500000,0.000000,42.500000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<57.500000,0.000000,42.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<57.000000,0.000000,64.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<57.500000,0.000000,64.000000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<57.000000,0.000000,64.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<57.000000,0.000000,68.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<57.500000,0.000000,67.500000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<57.000000,0.000000,68.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<55.500000,-1.535000,70.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<57.500000,-1.535000,72.000000>}
box{<0,0,-0.012700><2.828427,0.035000,0.012700> rotate<0,-44.997030,0> translate<55.500000,-1.535000,70.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<57.000000,0.000000,57.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<58.000000,0.000000,58.500000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,-44.997030,0> translate<57.000000,0.000000,57.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<57.500000,0.000000,67.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<58.000000,0.000000,67.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<57.500000,0.000000,67.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<58.000000,0.000000,58.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<58.000000,0.000000,67.000000>}
box{<0,0,-0.012700><8.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<58.000000,0.000000,67.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<57.000000,0.000000,42.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<58.500000,0.000000,42.000000>}
box{<0,0,-0.012700><1.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<57.000000,0.000000,42.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<57.500000,0.000000,43.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<58.500000,0.000000,44.500000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,-44.997030,0> translate<57.500000,0.000000,43.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<57.000000,0.000000,44.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<58.500000,0.000000,45.500000>}
box{<0,0,-0.012700><2.121320,0.035000,0.012700> rotate<0,-44.997030,0> translate<57.000000,0.000000,44.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<56.500000,0.000000,51.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<58.500000,0.000000,49.500000>}
box{<0,0,-0.012700><2.828427,0.035000,0.012700> rotate<0,44.997030,0> translate<56.500000,0.000000,51.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<58.500000,0.000000,48.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<58.500000,0.000000,49.500000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,90.000000,0> translate<58.500000,0.000000,49.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<57.500000,-1.535000,64.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<58.500000,-1.535000,65.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,-44.997030,0> translate<57.500000,-1.535000,64.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<58.500000,0.000000,42.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<58.913400,0.000000,41.940000>}
box{<0,0,-0.012700><0.417731,0.035000,0.012700> rotate<0,8.257579,0> translate<58.500000,0.000000,42.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<58.500000,0.000000,44.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<58.913400,0.000000,44.480000>}
box{<0,0,-0.012700><0.413884,0.035000,0.012700> rotate<0,2.769587,0> translate<58.500000,0.000000,44.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<58.500000,0.000000,45.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<58.913400,0.000000,45.750000>}
box{<0,0,-0.012700><0.483114,0.035000,0.012700> rotate<0,-31.161024,0> translate<58.500000,0.000000,45.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<58.500000,0.000000,48.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<58.913400,0.000000,48.290000>}
box{<0,0,-0.012700><0.463680,0.035000,0.012700> rotate<0,26.927999,0> translate<58.500000,0.000000,48.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<56.500000,-1.535000,34.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<59.000000,-1.535000,32.000000>}
box{<0,0,-0.012700><3.535534,0.035000,0.012700> rotate<0,44.997030,0> translate<56.500000,-1.535000,34.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<58.913400,0.000000,43.210000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<59.000000,0.000000,43.500000>}
box{<0,0,-0.012700><0.302654,0.035000,0.012700> rotate<0,-73.368444,0> translate<58.913400,0.000000,43.210000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<58.913400,0.000000,47.020000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<59.000000,0.000000,47.000000>}
box{<0,0,-0.012700><0.088879,0.035000,0.012700> rotate<0,13.003422,0> translate<58.913400,0.000000,47.020000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<57.500000,0.000000,33.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<60.000000,0.000000,35.500000>}
box{<0,0,-0.012700><3.535534,0.035000,0.012700> rotate<0,-44.997030,0> translate<57.500000,0.000000,33.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<60.000000,0.000000,42.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<60.000000,0.000000,35.500000>}
box{<0,0,-0.012700><7.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<60.000000,0.000000,35.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<57.500000,0.000000,42.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<60.000000,0.000000,42.500000>}
box{<0,0,-0.012700><2.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<57.500000,0.000000,42.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<55.500000,-1.535000,59.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<60.000000,-1.535000,63.500000>}
box{<0,0,-0.012700><6.363961,0.035000,0.012700> rotate<0,-44.997030,0> translate<55.500000,-1.535000,59.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<57.000000,0.000000,74.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<60.000000,0.000000,71.500000>}
box{<0,0,-0.012700><4.242641,0.035000,0.012700> rotate<0,44.997030,0> translate<57.000000,0.000000,74.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<39.500000,0.000000,16.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<67.000000,0.000000,16.500000>}
box{<0,0,-0.012700><27.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<39.500000,0.000000,16.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.000000,-1.535000,26.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<67.000000,-1.535000,26.500000>}
box{<0,0,-0.012700><36.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<31.000000,-1.535000,26.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<67.000000,0.000000,16.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<67.240000,0.000000,16.086600>}
box{<0,0,-0.012700><0.478016,0.035000,0.012700> rotate<0,59.858676,0> translate<67.000000,0.000000,16.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<67.240000,0.000000,22.233400>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<67.500000,0.000000,22.500000>}
box{<0,0,-0.012700><0.372392,0.035000,0.012700> rotate<0,-45.715046,0> translate<67.240000,0.000000,22.233400> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.000000,-1.535000,19.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<68.000000,-1.535000,19.500000>}
box{<0,0,-0.012700><36.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<32.000000,-1.535000,19.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.000000,-1.535000,22.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<68.000000,-1.535000,22.000000>}
box{<0,0,-0.012700><37.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<31.000000,-1.535000,22.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<67.500000,0.000000,22.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<68.000000,0.000000,23.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,-44.997030,0> translate<67.500000,0.000000,22.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<68.000000,0.000000,32.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<68.000000,0.000000,23.000000>}
box{<0,0,-0.012700><9.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<68.000000,0.000000,23.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<59.000000,-1.535000,32.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<68.000000,-1.535000,32.000000>}
box{<0,0,-0.012700><9.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<59.000000,-1.535000,32.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<68.500000,0.000000,19.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<68.500000,0.000000,16.500000>}
box{<0,0,-0.012700><3.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<68.500000,0.000000,16.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<57.000000,0.000000,31.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<68.500000,0.000000,19.500000>}
box{<0,0,-0.012700><16.263456,0.035000,0.012700> rotate<0,44.997030,0> translate<57.000000,0.000000,31.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<68.500000,0.000000,22.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<68.500000,0.000000,19.500000>}
box{<0,0,-0.012700><2.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<68.500000,0.000000,19.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<68.500000,0.000000,16.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<68.510000,0.000000,16.086600>}
box{<0,0,-0.012700><0.413521,0.035000,0.012700> rotate<0,88.608457,0> translate<68.500000,0.000000,16.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<68.500000,0.000000,22.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<68.510000,0.000000,22.233400>}
box{<0,0,-0.012700><0.233614,0.035000,0.012700> rotate<0,-87.540891,0> translate<68.500000,0.000000,22.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<68.000000,-1.535000,19.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<69.000000,-1.535000,18.500000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,44.997030,0> translate<68.000000,-1.535000,19.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<68.000000,-1.535000,22.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<69.000000,-1.535000,21.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,44.997030,0> translate<68.000000,-1.535000,22.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<69.000000,0.000000,21.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<69.000000,0.000000,21.500000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<69.000000,0.000000,21.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<59.000000,0.000000,47.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<69.000000,0.000000,47.000000>}
box{<0,0,-0.012700><10.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<59.000000,0.000000,47.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<69.000000,0.000000,60.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<69.000000,0.000000,47.000000>}
box{<0,0,-0.012700><13.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<69.000000,0.000000,47.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<69.000000,0.000000,21.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<69.500000,0.000000,22.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,-44.997030,0> translate<69.000000,0.000000,21.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<59.000000,0.000000,43.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<69.500000,0.000000,43.500000>}
box{<0,0,-0.012700><10.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<59.000000,0.000000,43.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<69.500000,0.000000,52.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<69.500000,0.000000,43.500000>}
box{<0,0,-0.012700><8.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<69.500000,0.000000,43.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<69.500000,0.000000,22.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<69.780000,0.000000,22.233400>}
box{<0,0,-0.012700><0.364521,0.035000,0.012700> rotate<0,-39.810994,0> translate<69.500000,0.000000,22.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<69.780000,0.000000,16.086600>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<70.000000,0.000000,16.000000>}
box{<0,0,-0.012700><0.236431,0.035000,0.012700> rotate<0,21.484985,0> translate<69.780000,0.000000,16.086600> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<70.000000,0.000000,54.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<70.000000,0.000000,30.000000>}
box{<0,0,-0.012700><24.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<70.000000,0.000000,30.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<60.000000,-1.535000,63.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<70.000000,-1.535000,63.500000>}
box{<0,0,-0.012700><10.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<60.000000,-1.535000,63.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<70.000000,0.000000,16.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<70.500000,0.000000,15.500000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<70.000000,0.000000,16.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<70.500000,0.000000,15.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<70.500000,0.000000,15.500000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<70.500000,0.000000,15.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<70.500000,0.000000,29.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<70.500000,0.000000,21.000000>}
box{<0,0,-0.012700><8.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<70.500000,0.000000,21.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<70.000000,0.000000,30.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<70.500000,0.000000,29.500000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<70.000000,0.000000,30.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<67.000000,-1.535000,26.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<70.500000,-1.535000,30.000000>}
box{<0,0,-0.012700><4.949747,0.035000,0.012700> rotate<0,-44.997030,0> translate<67.000000,-1.535000,26.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<70.500000,0.000000,30.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<70.500000,0.000000,32.000000>}
box{<0,0,-0.012700><2.000000,0.035000,0.012700> rotate<0,90.000000,0> translate<70.500000,0.000000,32.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<68.000000,-1.535000,32.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<70.500000,-1.535000,34.500000>}
box{<0,0,-0.012700><3.535534,0.035000,0.012700> rotate<0,-44.997030,0> translate<68.000000,-1.535000,32.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<70.500000,0.000000,15.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.000000,0.000000,14.500000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<70.500000,0.000000,15.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<69.000000,0.000000,18.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.000000,0.000000,16.500000>}
box{<0,0,-0.012700><2.828427,0.035000,0.012700> rotate<0,44.997030,0> translate<69.000000,0.000000,18.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<32.500000,-1.535000,20.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.000000,-1.535000,20.000000>}
box{<0,0,-0.012700><38.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<32.500000,-1.535000,20.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.000000,0.000000,31.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.000000,0.000000,22.500000>}
box{<0,0,-0.012700><8.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<71.000000,0.000000,22.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<70.500000,0.000000,32.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.000000,0.000000,32.500000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,-44.997030,0> translate<70.500000,0.000000,32.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<70.940000,0.000000,32.786600>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.000000,0.000000,32.500000>}
box{<0,0,-0.012700><0.292813,0.035000,0.012700> rotate<0,78.170680,0> translate<70.940000,0.000000,32.786600> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<70.500000,0.000000,34.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.000000,0.000000,35.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,-44.997030,0> translate<70.500000,0.000000,34.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.000000,0.000000,38.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.000000,0.000000,35.000000>}
box{<0,0,-0.012700><3.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<71.000000,0.000000,35.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<70.940000,0.000000,38.933400>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.000000,0.000000,38.500000>}
box{<0,0,-0.012700><0.437533,0.035000,0.012700> rotate<0,82.112639,0> translate<70.940000,0.000000,38.933400> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.000000,0.000000,16.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.050000,0.000000,16.086600>}
box{<0,0,-0.012700><0.416413,0.035000,0.012700> rotate<0,83.098190,0> translate<71.000000,0.000000,16.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.000000,0.000000,22.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.050000,0.000000,22.233400>}
box{<0,0,-0.012700><0.271248,0.035000,0.012700> rotate<0,79.372511,0> translate<71.000000,0.000000,22.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<70.500000,0.000000,21.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.500000,0.000000,21.000000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<70.500000,0.000000,21.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.500000,0.000000,21.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.500000,0.000000,23.500000>}
box{<0,0,-0.012700><2.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<71.500000,0.000000,23.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.000000,0.000000,31.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.500000,0.000000,31.500000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,-44.997030,0> translate<71.000000,0.000000,31.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.500000,0.000000,44.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.500000,0.000000,31.500000>}
box{<0,0,-0.012700><12.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<71.500000,0.000000,31.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.500000,0.000000,55.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.500000,0.000000,46.500000>}
box{<0,0,-0.012700><9.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<71.500000,0.000000,46.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<69.500000,-1.535000,52.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.500000,-1.535000,54.000000>}
box{<0,0,-0.012700><2.828427,0.035000,0.012700> rotate<0,-44.997030,0> translate<69.500000,-1.535000,52.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<70.000000,0.000000,54.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.500000,0.000000,56.000000>}
box{<0,0,-0.012700><2.121320,0.035000,0.012700> rotate<0,-44.997030,0> translate<70.000000,0.000000,54.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.000000,0.000000,36.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.000000,0.000000,33.000000>}
box{<0,0,-0.012700><3.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<72.000000,0.000000,33.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.000000,0.000000,38.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.000000,0.000000,36.000000>}
box{<0,0,-0.012700><2.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<72.000000,0.000000,36.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.500000,0.000000,56.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.000000,0.000000,56.000000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<71.500000,0.000000,56.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.000000,0.000000,50.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.000000,0.000000,56.000000>}
box{<0,0,-0.012700><6.000000,0.035000,0.012700> rotate<0,90.000000,0> translate<72.000000,0.000000,56.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.500000,0.000000,76.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.000000,0.000000,76.500000>}
box{<0,0,-0.012700><17.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<54.500000,0.000000,76.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.000000,0.000000,71.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.000000,0.000000,76.500000>}
box{<0,0,-0.012700><5.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<72.000000,0.000000,76.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.000000,0.000000,33.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.210000,0.000000,32.786600>}
box{<0,0,-0.012700><0.299399,0.035000,0.012700> rotate<0,45.457088,0> translate<72.000000,0.000000,33.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.000000,0.000000,38.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.210000,0.000000,38.933400>}
box{<0,0,-0.012700><0.481597,0.035000,0.012700> rotate<0,-64.143683,0> translate<72.000000,0.000000,38.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.320000,0.000000,16.086600>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.500000,0.000000,16.500000>}
box{<0,0,-0.012700><0.450888,0.035000,0.012700> rotate<0,-66.466647,0> translate<72.320000,0.000000,16.086600> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.500000,0.000000,19.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.500000,0.000000,16.500000>}
box{<0,0,-0.012700><3.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<72.500000,0.000000,16.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<68.500000,0.000000,19.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.500000,0.000000,19.500000>}
box{<0,0,-0.012700><4.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<68.500000,0.000000,19.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.500000,0.000000,22.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.500000,0.000000,19.500000>}
box{<0,0,-0.012700><2.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<72.500000,0.000000,19.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.320000,0.000000,22.233400>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.500000,0.000000,22.000000>}
box{<0,0,-0.012700><0.294747,0.035000,0.012700> rotate<0,52.356839,0> translate<72.320000,0.000000,22.233400> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<37.500000,-1.535000,37.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.500000,-1.535000,37.500000>}
box{<0,0,-0.012700><35.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<37.500000,-1.535000,37.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.500000,0.000000,54.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.500000,0.000000,62.000000>}
box{<0,0,-0.012700><8.000000,0.035000,0.012700> rotate<0,90.000000,0> translate<72.500000,0.000000,62.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<69.000000,0.000000,60.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.500000,0.000000,63.500000>}
box{<0,0,-0.012700><4.949747,0.035000,0.012700> rotate<0,-44.997030,0> translate<69.000000,0.000000,60.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<56.500000,0.000000,70.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.500000,0.000000,70.000000>}
box{<0,0,-0.012700><16.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<56.500000,0.000000,70.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.500000,0.000000,69.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.500000,0.000000,70.000000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<72.500000,0.000000,70.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<60.000000,-1.535000,71.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.500000,-1.535000,71.500000>}
box{<0,0,-0.012700><12.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<60.000000,-1.535000,71.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<57.500000,-1.535000,72.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.500000,-1.535000,72.000000>}
box{<0,0,-0.012700><15.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<57.500000,-1.535000,72.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.000000,0.000000,18.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.000000,0.000000,15.000000>}
box{<0,0,-0.012700><3.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<73.000000,0.000000,15.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.000000,-1.535000,20.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.000000,-1.535000,22.000000>}
box{<0,0,-0.012700><2.828427,0.035000,0.012700> rotate<0,-44.997030,0> translate<71.000000,-1.535000,20.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<34.500000,-1.535000,30.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.000000,-1.535000,30.500000>}
box{<0,0,-0.012700><38.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<34.500000,-1.535000,30.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.500000,-1.535000,44.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.000000,-1.535000,45.500000>}
box{<0,0,-0.012700><2.121320,0.035000,0.012700> rotate<0,-44.997030,0> translate<71.500000,-1.535000,44.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<55.500000,-1.535000,50.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.000000,-1.535000,50.500000>}
box{<0,0,-0.012700><17.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<55.500000,-1.535000,50.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<56.000000,-1.535000,51.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.000000,-1.535000,51.500000>}
box{<0,0,-0.012700><17.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<56.000000,-1.535000,51.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.500000,0.000000,54.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.000000,0.000000,53.500000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<72.500000,0.000000,54.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.500000,-1.535000,54.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.000000,-1.535000,54.000000>}
box{<0,0,-0.012700><1.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<71.500000,-1.535000,54.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<58.500000,-1.535000,65.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.000000,-1.535000,65.000000>}
box{<0,0,-0.012700><14.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<58.500000,-1.535000,65.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.500000,-1.535000,65.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.000000,-1.535000,65.500000>}
box{<0,0,-0.012700><18.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<54.500000,-1.535000,65.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.000000,0.000000,22.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.500000,0.000000,22.000000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<73.000000,0.000000,22.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.480000,0.000000,32.786600>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.500000,0.000000,33.000000>}
box{<0,0,-0.012700><0.214335,0.035000,0.012700> rotate<0,-84.640252,0> translate<73.480000,0.000000,32.786600> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.500000,0.000000,35.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.500000,0.000000,33.000000>}
box{<0,0,-0.012700><2.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<73.500000,0.000000,33.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.500000,0.000000,37.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.500000,0.000000,38.500000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,-44.997030,0> translate<72.500000,0.000000,37.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.480000,0.000000,38.933400>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.500000,0.000000,38.500000>}
box{<0,0,-0.012700><0.433861,0.035000,0.012700> rotate<0,87.352095,0> translate<73.480000,0.000000,38.933400> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.500000,0.000000,62.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.500000,0.000000,63.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,-44.997030,0> translate<72.500000,0.000000,62.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.000000,-1.535000,65.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.500000,-1.535000,65.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<73.000000,-1.535000,65.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.500000,0.000000,64.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.500000,0.000000,65.000000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<73.500000,0.000000,65.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.000000,0.000000,65.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.500000,0.000000,65.500000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,-44.997030,0> translate<73.000000,0.000000,65.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<70.000000,0.000000,63.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.500000,0.000000,67.000000>}
box{<0,0,-0.012700><4.949747,0.035000,0.012700> rotate<0,-44.997030,0> translate<70.000000,0.000000,63.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.500000,0.000000,69.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.500000,0.000000,68.500000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,44.997030,0> translate<72.500000,0.000000,69.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.000000,0.000000,71.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.500000,0.000000,69.500000>}
box{<0,0,-0.012700><2.121320,0.035000,0.012700> rotate<0,44.997030,0> translate<72.000000,0.000000,71.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.500000,0.000000,71.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.500000,0.000000,70.500000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,44.997030,0> translate<72.500000,0.000000,71.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.500000,0.000000,72.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.500000,0.000000,72.000000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<72.500000,0.000000,72.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<54.000000,0.000000,77.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.500000,0.000000,77.000000>}
box{<0,0,-0.012700><19.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<54.000000,0.000000,77.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.500000,0.000000,73.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.500000,0.000000,77.000000>}
box{<0,0,-0.012700><3.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<73.500000,0.000000,77.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.500000,0.000000,16.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.590000,0.000000,16.086600>}
box{<0,0,-0.012700><0.423083,0.035000,0.012700> rotate<0,77.712836,0> translate<73.500000,0.000000,16.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.500000,0.000000,22.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.590000,0.000000,22.233400>}
box{<0,0,-0.012700><0.250151,0.035000,0.012700> rotate<0,-68.908608,0> translate<73.500000,0.000000,22.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.500000,0.000000,63.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.960000,0.000000,63.150000>}
box{<0,0,-0.012700><0.483839,0.035000,0.012700> rotate<0,-18.059280,0> translate<73.500000,0.000000,63.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.500000,0.000000,64.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.960000,0.000000,64.420000>}
box{<0,0,-0.012700><0.466905,0.035000,0.012700> rotate<0,9.865156,0> translate<73.500000,0.000000,64.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.500000,0.000000,65.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.960000,0.000000,65.690000>}
box{<0,0,-0.012700><0.497695,0.035000,0.012700> rotate<0,-22.441272,0> translate<73.500000,0.000000,65.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.500000,0.000000,67.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.960000,0.000000,66.960000>}
box{<0,0,-0.012700><0.461736,0.035000,0.012700> rotate<0,4.969413,0> translate<73.500000,0.000000,67.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.500000,0.000000,68.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.960000,0.000000,68.230000>}
box{<0,0,-0.012700><0.533385,0.035000,0.012700> rotate<0,30.409074,0> translate<73.500000,0.000000,68.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.500000,0.000000,69.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.960000,0.000000,69.500000>}
box{<0,0,-0.012700><0.460000,0.035000,0.012700> rotate<0,0.000000,0> translate<73.500000,0.000000,69.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.500000,0.000000,70.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.960000,0.000000,70.770000>}
box{<0,0,-0.012700><0.533385,0.035000,0.012700> rotate<0,-30.409074,0> translate<73.500000,0.000000,70.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.500000,0.000000,72.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.960000,0.000000,72.040000>}
box{<0,0,-0.012700><0.461736,0.035000,0.012700> rotate<0,-4.969413,0> translate<73.500000,0.000000,72.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.500000,0.000000,73.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.960000,0.000000,73.310000>}
box{<0,0,-0.012700><0.497695,0.035000,0.012700> rotate<0,22.441272,0> translate<73.500000,0.000000,73.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.000000,0.000000,15.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.000000,0.000000,15.000000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<73.000000,0.000000,15.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.500000,0.000000,23.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.000000,0.000000,23.500000>}
box{<0,0,-0.012700><2.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<71.500000,0.000000,23.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.000000,-1.535000,30.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.000000,-1.535000,31.500000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,-44.997030,0> translate<73.000000,-1.535000,30.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.000000,0.000000,31.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.000000,0.000000,32.000000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<74.000000,0.000000,32.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.000000,0.000000,44.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.000000,0.000000,39.500000>}
box{<0,0,-0.012700><4.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<74.000000,0.000000,39.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.500000,0.000000,46.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.000000,0.000000,44.000000>}
box{<0,0,-0.012700><3.535534,0.035000,0.012700> rotate<0,44.997030,0> translate<71.500000,0.000000,46.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.000000,0.000000,45.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.000000,0.000000,46.500000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,-44.997030,0> translate<73.000000,0.000000,45.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.000000,0.000000,50.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.000000,0.000000,51.500000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,-44.997030,0> translate<73.000000,0.000000,50.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.000000,0.000000,32.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.500000,0.000000,32.500000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,-44.997030,0> translate<74.000000,0.000000,32.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<34.500000,-1.535000,35.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.500000,-1.535000,35.000000>}
box{<0,0,-0.012700><40.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<34.500000,-1.535000,35.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.000000,0.000000,39.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.500000,0.000000,39.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<74.000000,0.000000,39.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.000000,0.000000,46.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.500000,0.000000,46.500000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<74.000000,0.000000,46.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.000000,0.000000,50.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.500000,0.000000,47.500000>}
box{<0,0,-0.012700><3.535534,0.035000,0.012700> rotate<0,44.997030,0> translate<72.000000,0.000000,50.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.000000,0.000000,51.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.500000,0.000000,51.500000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<74.000000,0.000000,51.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.000000,0.000000,51.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.500000,0.000000,53.000000>}
box{<0,0,-0.012700><2.121320,0.035000,0.012700> rotate<0,-44.997030,0> translate<73.000000,0.000000,51.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.000000,0.000000,54.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.500000,0.000000,55.500000>}
box{<0,0,-0.012700><2.121320,0.035000,0.012700> rotate<0,-44.997030,0> translate<73.000000,0.000000,54.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.500000,0.000000,46.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.560000,0.000000,46.470000>}
box{<0,0,-0.012700><0.067082,0.035000,0.012700> rotate<0,26.563298,0> translate<74.500000,0.000000,46.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.500000,0.000000,47.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.560000,0.000000,47.740000>}
box{<0,0,-0.012700><0.247386,0.035000,0.012700> rotate<0,-75.958743,0> translate<74.500000,0.000000,47.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.500000,0.000000,51.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.560000,0.000000,51.550000>}
box{<0,0,-0.012700><0.078102,0.035000,0.012700> rotate<0,-39.802944,0> translate<74.500000,0.000000,51.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.500000,0.000000,53.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.560000,0.000000,52.820000>}
box{<0,0,-0.012700><0.189737,0.035000,0.012700> rotate<0,71.560328,0> translate<74.500000,0.000000,53.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.500000,0.000000,55.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.560000,0.000000,55.360000>}
box{<0,0,-0.012700><0.152315,0.035000,0.012700> rotate<0,66.797001,0> translate<74.500000,0.000000,55.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.500000,0.000000,32.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.750000,0.000000,32.786600>}
box{<0,0,-0.012700><0.380315,0.035000,0.012700> rotate<0,-48.898716,0> translate<74.500000,0.000000,32.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.500000,0.000000,39.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.750000,0.000000,38.933400>}
box{<0,0,-0.012700><0.258719,0.035000,0.012700> rotate<0,14.916167,0> translate<74.500000,0.000000,39.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.000000,0.000000,15.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<75.000000,0.000000,16.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,-44.997030,0> translate<74.000000,0.000000,15.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.860000,0.000000,16.086600>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<75.000000,0.000000,16.000000>}
box{<0,0,-0.012700><0.164619,0.035000,0.012700> rotate<0,31.737656,0> translate<74.860000,0.000000,16.086600> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.000000,0.000000,23.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<75.000000,0.000000,22.500000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,44.997030,0> translate<74.000000,0.000000,23.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.860000,0.000000,22.233400>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<75.000000,0.000000,22.500000>}
box{<0,0,-0.012700><0.301124,0.035000,0.012700> rotate<0,-62.290520,0> translate<74.860000,0.000000,22.233400> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.560000,0.000000,45.200000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<75.000000,0.000000,45.000000>}
box{<0,0,-0.012700><0.483322,0.035000,0.012700> rotate<0,24.442342,0> translate<74.560000,0.000000,45.200000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.560000,0.000000,49.010000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<75.000000,0.000000,49.000000>}
box{<0,0,-0.012700><0.440114,0.035000,0.012700> rotate<0,1.301867,0> translate<74.560000,0.000000,49.010000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.560000,0.000000,50.280000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<75.000000,0.000000,50.500000>}
box{<0,0,-0.012700><0.491935,0.035000,0.012700> rotate<0,-26.563298,0> translate<74.560000,0.000000,50.280000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.560000,0.000000,54.090000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<75.000000,0.000000,54.000000>}
box{<0,0,-0.012700><0.449110,0.035000,0.012700> rotate<0,11.559368,0> translate<74.560000,0.000000,54.090000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<57.500000,0.000000,67.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<75.000000,0.000000,67.500000>}
box{<0,0,-0.012700><17.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<57.500000,0.000000,67.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<75.000000,0.000000,67.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<75.500000,0.000000,67.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<75.000000,0.000000,67.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<75.500000,0.000000,67.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<75.500000,0.000000,75.500000>}
box{<0,0,-0.012700><8.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<75.500000,0.000000,75.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<76.000000,0.000000,36.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<76.000000,0.000000,33.000000>}
box{<0,0,-0.012700><3.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<76.000000,0.000000,33.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.000000,0.000000,36.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<76.000000,0.000000,36.000000>}
box{<0,0,-0.012700><4.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<72.000000,0.000000,36.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<76.000000,0.000000,38.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<76.000000,0.000000,36.000000>}
box{<0,0,-0.012700><2.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<76.000000,0.000000,36.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.500000,-1.535000,35.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<76.000000,-1.535000,38.000000>}
box{<0,0,-0.012700><3.535534,0.035000,0.012700> rotate<0,-44.997030,0> translate<73.500000,-1.535000,35.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<75.000000,0.000000,45.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<76.000000,0.000000,46.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,-44.997030,0> translate<75.000000,0.000000,45.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<76.000000,0.000000,47.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<76.000000,0.000000,46.000000>}
box{<0,0,-0.012700><1.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<76.000000,0.000000,46.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<76.000000,-1.535000,53.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<76.000000,-1.535000,47.500000>}
box{<0,0,-0.012700><6.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<76.000000,-1.535000,47.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.000000,0.000000,53.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<76.000000,0.000000,53.500000>}
box{<0,0,-0.012700><3.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<73.000000,0.000000,53.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<75.000000,0.000000,54.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<76.000000,0.000000,55.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,-44.997030,0> translate<75.000000,0.000000,54.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<72.500000,0.000000,63.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<76.000000,0.000000,63.500000>}
box{<0,0,-0.012700><3.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<72.500000,0.000000,63.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<76.000000,0.000000,55.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<76.000000,0.000000,63.500000>}
box{<0,0,-0.012700><8.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<76.000000,0.000000,63.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<76.000000,0.000000,32.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<76.020000,0.000000,32.786600>}
box{<0,0,-0.012700><0.287297,0.035000,0.012700> rotate<0,-86.002485,0> translate<76.000000,0.000000,32.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<76.000000,0.000000,33.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<76.020000,0.000000,32.786600>}
box{<0,0,-0.012700><0.214335,0.035000,0.012700> rotate<0,84.640252,0> translate<76.000000,0.000000,33.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<76.000000,0.000000,38.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<76.020000,0.000000,38.933400>}
box{<0,0,-0.012700><0.433861,0.035000,0.012700> rotate<0,-87.352095,0> translate<76.000000,0.000000,38.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<76.000000,0.000000,53.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<76.500000,0.000000,53.500000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<76.000000,0.000000,53.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<76.500000,0.000000,66.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<76.500000,0.000000,53.500000>}
box{<0,0,-0.012700><12.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<76.500000,0.000000,53.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<75.500000,0.000000,67.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<76.500000,0.000000,66.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,44.997030,0> translate<75.500000,0.000000,67.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<76.000000,0.000000,32.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<77.000000,0.000000,31.500000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,44.997030,0> translate<76.000000,0.000000,32.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<74.500000,-1.535000,35.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<77.000000,-1.535000,37.500000>}
box{<0,0,-0.012700><3.535534,0.035000,0.012700> rotate<0,-44.997030,0> translate<74.500000,-1.535000,35.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<77.000000,0.000000,37.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<77.000000,0.000000,38.500000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,90.000000,0> translate<77.000000,0.000000,38.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<77.000000,0.000000,38.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<77.290000,0.000000,38.933400>}
box{<0,0,-0.012700><0.521474,0.035000,0.012700> rotate<0,-56.208708,0> translate<77.000000,0.000000,38.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<77.290000,0.000000,32.786600>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<77.500000,0.000000,32.500000>}
box{<0,0,-0.012700><0.355302,0.035000,0.012700> rotate<0,53.765154,0> translate<77.290000,0.000000,32.786600> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<77.500000,0.000000,32.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<78.000000,0.000000,32.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<77.500000,0.000000,32.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<78.000000,0.000000,31.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<78.000000,0.000000,32.000000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,90.000000,0> translate<78.000000,0.000000,32.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<75.000000,0.000000,45.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<78.000000,0.000000,42.000000>}
box{<0,0,-0.012700><4.242641,0.035000,0.012700> rotate<0,44.997030,0> translate<75.000000,0.000000,45.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<78.000000,0.000000,33.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<78.000000,0.000000,42.000000>}
box{<0,0,-0.012700><8.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<78.000000,0.000000,42.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.000000,0.000000,18.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<78.500000,0.000000,24.000000>}
box{<0,0,-0.012700><7.778175,0.035000,0.012700> rotate<0,-44.997030,0> translate<73.000000,0.000000,18.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<78.500000,0.000000,32.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<78.500000,0.000000,24.000000>}
box{<0,0,-0.012700><8.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<78.500000,0.000000,24.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<78.000000,0.000000,33.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<78.500000,0.000000,33.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<78.000000,0.000000,33.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<78.500000,0.000000,40.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<78.500000,0.000000,39.000000>}
box{<0,0,-0.012700><1.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<78.500000,0.000000,39.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<78.500000,0.000000,32.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<78.560000,0.000000,32.786600>}
box{<0,0,-0.012700><0.292813,0.035000,0.012700> rotate<0,-78.170680,0> translate<78.500000,0.000000,32.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<78.500000,0.000000,33.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<78.560000,0.000000,32.786600>}
box{<0,0,-0.012700><0.221674,0.035000,0.012700> rotate<0,74.291124,0> translate<78.500000,0.000000,33.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<78.500000,0.000000,39.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<78.560000,0.000000,38.933400>}
box{<0,0,-0.012700><0.089641,0.035000,0.012700> rotate<0,47.981115,0> translate<78.500000,0.000000,39.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<73.500000,0.000000,16.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<79.000000,0.000000,22.000000>}
box{<0,0,-0.012700><7.778175,0.035000,0.012700> rotate<0,-44.997030,0> translate<73.500000,0.000000,16.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<79.000000,0.000000,45.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<79.000000,0.000000,22.000000>}
box{<0,0,-0.012700><23.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<79.000000,0.000000,22.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<75.000000,0.000000,49.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<79.000000,0.000000,45.000000>}
box{<0,0,-0.012700><5.656854,0.035000,0.012700> rotate<0,44.997030,0> translate<75.000000,0.000000,49.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.000000,0.000000,14.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<79.500000,0.000000,14.500000>}
box{<0,0,-0.012700><8.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<71.000000,0.000000,14.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<79.500000,0.000000,46.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<79.500000,0.000000,14.500000>}
box{<0,0,-0.012700><31.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<79.500000,0.000000,14.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<75.000000,0.000000,50.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<79.500000,0.000000,46.000000>}
box{<0,0,-0.012700><6.363961,0.035000,0.012700> rotate<0,44.997030,0> translate<75.000000,0.000000,50.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<79.500000,0.000000,74.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<79.500000,0.000000,71.000000>}
box{<0,0,-0.012700><3.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<79.500000,0.000000,71.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<80.000000,0.000000,55.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<80.000000,0.000000,46.500000>}
box{<0,0,-0.012700><9.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<80.000000,0.000000,46.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<71.500000,-1.535000,55.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<80.000000,-1.535000,64.000000>}
box{<0,0,-0.012700><12.020815,0.035000,0.012700> rotate<0,-44.997030,0> translate<71.500000,-1.535000,55.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<80.000000,0.000000,74.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<80.000000,0.000000,73.000000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<80.000000,0.000000,73.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<80.500000,0.000000,47.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<80.500000,0.000000,48.000000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<80.500000,0.000000,48.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<79.500000,0.000000,74.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<80.500000,0.000000,75.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,-44.997030,0> translate<79.500000,0.000000,74.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<80.500000,0.000000,47.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.000000,0.000000,47.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<80.500000,0.000000,47.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<79.500000,0.000000,71.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.000000,0.000000,71.000000>}
box{<0,0,-0.012700><1.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<79.500000,0.000000,71.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<80.000000,0.000000,73.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.000000,0.000000,72.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,44.997030,0> translate<80.000000,0.000000,73.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.000000,0.000000,71.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.160000,0.000000,70.770000>}
box{<0,0,-0.012700><0.280179,0.035000,0.012700> rotate<0,55.171869,0> translate<81.000000,0.000000,71.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.000000,0.000000,72.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.160000,0.000000,72.040000>}
box{<0,0,-0.012700><0.164924,0.035000,0.012700> rotate<0,-14.035317,0> translate<81.000000,0.000000,72.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<80.000000,0.000000,46.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.500000,0.000000,46.500000>}
box{<0,0,-0.012700><1.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<80.000000,0.000000,46.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<80.500000,0.000000,48.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.500000,0.000000,49.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,-44.997030,0> translate<80.500000,0.000000,48.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.160000,0.000000,64.420000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.500000,0.000000,64.500000>}
box{<0,0,-0.012700><0.349285,0.035000,0.012700> rotate<0,-13.239646,0> translate<81.160000,0.000000,64.420000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.160000,0.000000,65.690000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.500000,0.000000,65.500000>}
box{<0,0,-0.012700><0.389487,0.035000,0.012700> rotate<0,29.195559,0> translate<81.160000,0.000000,65.690000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.160000,0.000000,66.960000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.500000,0.000000,67.000000>}
box{<0,0,-0.012700><0.342345,0.035000,0.012700> rotate<0,-6.709394,0> translate<81.160000,0.000000,66.960000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.160000,0.000000,68.230000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.500000,0.000000,68.000000>}
box{<0,0,-0.012700><0.410488,0.035000,0.012700> rotate<0,34.074946,0> translate<81.160000,0.000000,68.230000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.160000,0.000000,73.310000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.500000,0.000000,73.500000>}
box{<0,0,-0.012700><0.389487,0.035000,0.012700> rotate<0,-29.195559,0> translate<81.160000,0.000000,73.310000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.500000,0.000000,46.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.760000,0.000000,46.470000>}
box{<0,0,-0.012700><0.261725,0.035000,0.012700> rotate<0,6.581510,0> translate<81.500000,0.000000,46.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.500000,0.000000,49.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.760000,0.000000,49.010000>}
box{<0,0,-0.012700><0.260192,0.035000,0.012700> rotate<0,-2.202453,0> translate<81.500000,0.000000,49.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.760000,0.000000,47.740000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<82.000000,0.000000,47.500000>}
box{<0,0,-0.012700><0.339411,0.035000,0.012700> rotate<0,44.997030,0> translate<81.760000,0.000000,47.740000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.760000,0.000000,50.280000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<82.000000,0.000000,50.500000>}
box{<0,0,-0.012700><0.325576,0.035000,0.012700> rotate<0,-42.507642,0> translate<81.760000,0.000000,50.280000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.760000,0.000000,51.550000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<82.000000,0.000000,51.500000>}
box{<0,0,-0.012700><0.245153,0.035000,0.012700> rotate<0,11.767512,0> translate<81.760000,0.000000,51.550000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.760000,0.000000,52.820000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<82.000000,0.000000,53.000000>}
box{<0,0,-0.012700><0.300000,0.035000,0.012700> rotate<0,-36.867464,0> translate<81.760000,0.000000,52.820000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.760000,0.000000,54.090000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<82.000000,0.000000,54.000000>}
box{<0,0,-0.012700><0.256320,0.035000,0.012700> rotate<0,20.554689,0> translate<81.760000,0.000000,54.090000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.760000,0.000000,55.360000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<82.000000,0.000000,55.500000>}
box{<0,0,-0.012700><0.277849,0.035000,0.012700> rotate<0,-30.254440,0> translate<81.760000,0.000000,55.360000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<80.000000,0.000000,55.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<83.500000,0.000000,59.000000>}
box{<0,0,-0.012700><4.949747,0.035000,0.012700> rotate<0,-44.997030,0> translate<80.000000,0.000000,55.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<82.000000,0.000000,55.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<90.000000,0.000000,55.500000>}
box{<0,0,-0.012700><8.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<82.000000,0.000000,55.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<90.000000,0.000000,54.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<90.000000,0.000000,55.500000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,90.000000,0> translate<90.000000,0.000000,55.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<80.000000,-1.535000,64.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<91.000000,-1.535000,64.000000>}
box{<0,0,-0.012700><11.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<80.000000,-1.535000,64.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.500000,0.000000,64.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<91.000000,0.000000,64.500000>}
box{<0,0,-0.012700><9.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<81.500000,0.000000,64.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<82.000000,0.000000,54.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<92.500000,0.000000,54.000000>}
box{<0,0,-0.012700><10.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<82.000000,0.000000,54.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.500000,0.000000,65.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<94.000000,0.000000,65.500000>}
box{<0,0,-0.012700><12.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<81.500000,0.000000,65.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<82.000000,0.000000,53.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<94.500000,0.000000,53.000000>}
box{<0,0,-0.012700><12.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<82.000000,0.000000,53.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.500000,0.000000,67.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<96.000000,0.000000,67.000000>}
box{<0,0,-0.012700><14.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<81.500000,0.000000,67.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<82.000000,0.000000,51.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<96.500000,0.000000,51.500000>}
box{<0,0,-0.012700><14.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<82.000000,0.000000,51.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<70.500000,-1.535000,34.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<97.000000,-1.535000,34.500000>}
box{<0,0,-0.012700><26.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<70.500000,-1.535000,34.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.000000,0.000000,47.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<97.000000,0.000000,47.000000>}
box{<0,0,-0.012700><16.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<81.000000,0.000000,47.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<97.000000,0.000000,46.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<97.000000,0.000000,47.000000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<97.000000,0.000000,47.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<82.000000,0.000000,50.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<97.000000,0.000000,50.500000>}
box{<0,0,-0.012700><15.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<82.000000,0.000000,50.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<97.000000,0.000000,51.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<97.000000,0.000000,50.500000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<97.000000,0.000000,50.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<96.500000,-1.535000,51.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<97.000000,-1.535000,51.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<96.500000,-1.535000,51.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<82.000000,0.000000,47.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<97.500000,0.000000,47.500000>}
box{<0,0,-0.012700><15.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<82.000000,0.000000,47.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<97.500000,0.000000,46.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<97.500000,0.000000,47.500000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,90.000000,0> translate<97.500000,0.000000,47.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.500000,0.000000,68.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<97.500000,0.000000,68.000000>}
box{<0,0,-0.012700><16.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<81.500000,0.000000,68.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<97.500000,0.000000,46.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<98.000000,0.000000,46.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<97.500000,0.000000,46.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.160000,0.000000,69.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<98.000000,0.000000,69.500000>}
box{<0,0,-0.012700><16.840000,0.035000,0.012700> rotate<0,0.000000,0> translate<81.160000,0.000000,69.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<98.000000,0.000000,67.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<98.000000,0.000000,69.500000>}
box{<0,0,-0.012700><2.000000,0.035000,0.012700> rotate<0,90.000000,0> translate<98.000000,0.000000,69.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<97.000000,0.000000,46.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<98.500000,0.000000,45.000000>}
box{<0,0,-0.012700><2.121320,0.035000,0.012700> rotate<0,44.997030,0> translate<97.000000,0.000000,46.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<94.500000,-1.535000,53.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<98.500000,-1.535000,49.000000>}
box{<0,0,-0.012700><5.656854,0.035000,0.012700> rotate<0,44.997030,0> translate<94.500000,-1.535000,53.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<97.000000,-1.535000,51.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<98.500000,-1.535000,53.000000>}
box{<0,0,-0.012700><2.121320,0.035000,0.012700> rotate<0,-44.997030,0> translate<97.000000,-1.535000,51.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<96.000000,-1.535000,67.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<98.500000,-1.535000,69.500000>}
box{<0,0,-0.012700><3.535534,0.035000,0.012700> rotate<0,-44.997030,0> translate<96.000000,-1.535000,67.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<81.500000,0.000000,73.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<98.500000,0.000000,73.500000>}
box{<0,0,-0.012700><17.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<81.500000,0.000000,73.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<98.500000,0.000000,61.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<98.500000,0.000000,73.500000>}
box{<0,0,-0.012700><12.000000,0.035000,0.012700> rotate<0,90.000000,0> translate<98.500000,0.000000,73.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<99.000000,0.000000,42.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<99.000000,0.000000,22.000000>}
box{<0,0,-0.012700><20.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<99.000000,0.000000,22.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.000000,-1.535000,26.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<99.000000,-1.535000,26.000000>}
box{<0,0,-0.012700><75.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<24.000000,-1.535000,26.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<98.000000,0.000000,46.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<99.000000,0.000000,46.000000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<98.000000,0.000000,46.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<99.000000,0.000000,54.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<99.000000,0.000000,46.000000>}
box{<0,0,-0.012700><8.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<99.000000,0.000000,46.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<80.000000,0.000000,74.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<99.000000,0.000000,74.000000>}
box{<0,0,-0.012700><19.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<80.000000,0.000000,74.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<99.000000,0.000000,63.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<99.000000,0.000000,74.000000>}
box{<0,0,-0.012700><11.000000,0.035000,0.012700> rotate<0,90.000000,0> translate<99.000000,0.000000,74.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<34.000000,-1.535000,22.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<99.500000,-1.535000,22.500000>}
box{<0,0,-0.012700><65.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<34.000000,-1.535000,22.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<99.500000,0.000000,24.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<99.500000,0.000000,22.500000>}
box{<0,0,-0.012700><1.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<99.500000,0.000000,22.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<99.500000,0.000000,32.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<99.500000,0.000000,30.500000>}
box{<0,0,-0.012700><1.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<99.500000,0.000000,30.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<97.000000,-1.535000,34.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<99.500000,-1.535000,32.000000>}
box{<0,0,-0.012700><3.535534,0.035000,0.012700> rotate<0,44.997030,0> translate<97.000000,-1.535000,34.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<90.000000,-1.535000,54.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<99.500000,-1.535000,45.000000>}
box{<0,0,-0.012700><13.435029,0.035000,0.012700> rotate<0,44.997030,0> translate<90.000000,-1.535000,54.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<92.500000,-1.535000,54.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<99.500000,-1.535000,47.000000>}
box{<0,0,-0.012700><9.899495,0.035000,0.012700> rotate<0,44.997030,0> translate<92.500000,-1.535000,54.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<98.000000,-1.535000,67.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<99.500000,-1.535000,66.000000>}
box{<0,0,-0.012700><2.121320,0.035000,0.012700> rotate<0,44.997030,0> translate<98.000000,-1.535000,67.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<99.500000,0.000000,24.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<99.810000,0.000000,24.086600>}
box{<0,0,-0.012700><0.321869,0.035000,0.012700> rotate<0,-15.606933,0> translate<99.500000,0.000000,24.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<99.500000,0.000000,30.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<99.810000,0.000000,30.233400>}
box{<0,0,-0.012700><0.408871,0.035000,0.012700> rotate<0,40.692845,0> translate<99.500000,0.000000,30.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<99.000000,0.000000,42.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.000000,0.000000,43.500000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,-44.997030,0> translate<99.000000,0.000000,42.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<99.000000,0.000000,54.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.000000,0.000000,55.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,-44.997030,0> translate<99.000000,0.000000,54.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<98.500000,0.000000,61.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.000000,0.000000,60.000000>}
box{<0,0,-0.012700><2.121320,0.035000,0.012700> rotate<0,44.997030,0> translate<98.500000,0.000000,61.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<99.000000,0.000000,63.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.000000,0.000000,62.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,44.997030,0> translate<99.000000,0.000000,63.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<99.500000,-1.535000,66.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.000000,-1.535000,66.000000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<99.500000,-1.535000,66.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<97.500000,-1.535000,68.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.000000,-1.535000,68.000000>}
box{<0,0,-0.012700><2.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<97.500000,-1.535000,68.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<98.500000,-1.535000,69.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.000000,-1.535000,69.500000>}
box{<0,0,-0.012700><1.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<98.500000,-1.535000,69.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<94.000000,-1.535000,65.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.000000,-1.535000,71.500000>}
box{<0,0,-0.012700><8.485281,0.035000,0.012700> rotate<0,-44.997030,0> translate<94.000000,-1.535000,65.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<91.000000,-1.535000,64.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.000000,-1.535000,73.000000>}
box{<0,0,-0.012700><12.727922,0.035000,0.012700> rotate<0,-44.997030,0> translate<91.000000,-1.535000,64.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<91.000000,-1.535000,64.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.000000,-1.535000,73.500000>}
box{<0,0,-0.012700><12.727922,0.035000,0.012700> rotate<0,-44.997030,0> translate<91.000000,-1.535000,64.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.000000,0.000000,43.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.140000,0.000000,43.880000>}
box{<0,0,-0.012700><0.404969,0.035000,0.012700> rotate<0,-69.770536,0> translate<100.000000,0.000000,43.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.000000,0.000000,60.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.140000,0.000000,59.880000>}
box{<0,0,-0.012700><0.184391,0.035000,0.012700> rotate<0,40.598615,0> translate<100.000000,0.000000,60.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.000000,0.000000,62.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.140000,0.000000,61.880000>}
box{<0,0,-0.012700><0.184391,0.035000,0.012700> rotate<0,40.598615,0> translate<100.000000,0.000000,62.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.000000,-1.535000,66.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.140000,-1.535000,65.880000>}
box{<0,0,-0.012700><0.184391,0.035000,0.012700> rotate<0,40.598615,0> translate<100.000000,-1.535000,66.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.000000,-1.535000,68.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.140000,-1.535000,67.880000>}
box{<0,0,-0.012700><0.184391,0.035000,0.012700> rotate<0,40.598615,0> translate<100.000000,-1.535000,68.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.000000,-1.535000,69.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.140000,-1.535000,69.880000>}
box{<0,0,-0.012700><0.404969,0.035000,0.012700> rotate<0,-69.770536,0> translate<100.000000,-1.535000,69.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.000000,-1.535000,71.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.140000,-1.535000,71.880000>}
box{<0,0,-0.012700><0.404969,0.035000,0.012700> rotate<0,-69.770536,0> translate<100.000000,-1.535000,71.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.000000,-1.535000,73.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.140000,-1.535000,73.880000>}
box{<0,0,-0.012700><0.404969,0.035000,0.012700> rotate<0,-69.770536,0> translate<100.000000,-1.535000,73.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<77.000000,-1.535000,31.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.500000,-1.535000,31.500000>}
box{<0,0,-0.012700><23.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<77.000000,-1.535000,31.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<99.500000,-1.535000,45.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.500000,-1.535000,45.000000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<99.500000,-1.535000,45.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.140000,-1.535000,45.880000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.500000,-1.535000,45.500000>}
box{<0,0,-0.012700><0.523450,0.035000,0.012700> rotate<0,46.545086,0> translate<100.140000,-1.535000,45.880000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<99.500000,-1.535000,47.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.500000,-1.535000,47.000000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<99.500000,-1.535000,47.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.140000,-1.535000,47.880000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.500000,-1.535000,47.500000>}
box{<0,0,-0.012700><0.523450,0.035000,0.012700> rotate<0,46.545086,0> translate<100.140000,-1.535000,47.880000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<98.500000,-1.535000,49.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.500000,-1.535000,49.000000>}
box{<0,0,-0.012700><2.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<98.500000,-1.535000,49.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.140000,-1.535000,49.880000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.500000,-1.535000,49.500000>}
box{<0,0,-0.012700><0.523450,0.035000,0.012700> rotate<0,46.545086,0> translate<100.140000,-1.535000,49.880000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<97.000000,-1.535000,51.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.500000,-1.535000,51.000000>}
box{<0,0,-0.012700><3.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<97.000000,-1.535000,51.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.140000,-1.535000,51.880000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.500000,-1.535000,51.500000>}
box{<0,0,-0.012700><0.523450,0.035000,0.012700> rotate<0,46.545086,0> translate<100.140000,-1.535000,51.880000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<98.500000,-1.535000,53.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.500000,-1.535000,53.000000>}
box{<0,0,-0.012700><2.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<98.500000,-1.535000,53.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.140000,-1.535000,53.880000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.500000,-1.535000,53.500000>}
box{<0,0,-0.012700><0.523450,0.035000,0.012700> rotate<0,46.545086,0> translate<100.140000,-1.535000,53.880000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.140000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.500000,0.000000,56.000000>}
box{<0,0,-0.012700><0.379473,0.035000,0.012700> rotate<0,-18.433732,0> translate<100.140000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.500000,0.000000,56.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.500000,0.000000,57.000000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,90.000000,0> translate<100.500000,0.000000,57.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.140000,-1.535000,57.880000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.500000,-1.535000,57.500000>}
box{<0,0,-0.012700><0.523450,0.035000,0.012700> rotate<0,46.545086,0> translate<100.140000,-1.535000,57.880000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.140000,0.000000,63.880000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.500000,0.000000,64.000000>}
box{<0,0,-0.012700><0.379473,0.035000,0.012700> rotate<0,-18.433732,0> translate<100.140000,0.000000,63.880000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,0.000000,27.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,0.000000,24.500000>}
box{<0,0,-0.012700><3.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<101.000000,0.000000,24.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,0.000000,30.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,0.000000,27.500000>}
box{<0,0,-0.012700><2.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<101.000000,0.000000,27.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.500000,0.000000,31.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,0.000000,31.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<100.500000,0.000000,31.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,0.000000,30.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,0.000000,31.000000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<101.000000,0.000000,31.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<98.500000,0.000000,45.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,0.000000,45.000000>}
box{<0,0,-0.012700><2.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<98.500000,0.000000,45.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.500000,-1.535000,45.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,-1.535000,45.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<100.500000,-1.535000,45.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,0.000000,52.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,0.000000,45.000000>}
box{<0,0,-0.012700><7.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<101.000000,0.000000,45.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.500000,-1.535000,47.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,-1.535000,47.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<100.500000,-1.535000,47.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.500000,-1.535000,49.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,-1.535000,49.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<100.500000,-1.535000,49.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.500000,-1.535000,51.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,-1.535000,51.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<100.500000,-1.535000,51.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.500000,-1.535000,53.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,-1.535000,53.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<100.500000,-1.535000,53.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.500000,-1.535000,57.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,-1.535000,57.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<100.500000,-1.535000,57.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,0.000000,64.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,0.000000,63.000000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<101.000000,0.000000,63.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.500000,0.000000,64.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,0.000000,64.500000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,-44.997030,0> translate<100.500000,0.000000,64.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<80.500000,0.000000,75.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,0.000000,75.000000>}
box{<0,0,-0.012700><20.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<80.500000,0.000000,75.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,0.000000,64.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,0.000000,75.000000>}
box{<0,0,-0.012700><10.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<101.000000,0.000000,75.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,0.000000,24.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.080000,0.000000,24.086600>}
box{<0,0,-0.012700><0.421070,0.035000,0.012700> rotate<0,79.042444,0> translate<101.000000,0.000000,24.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,0.000000,30.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.080000,0.000000,30.233400>}
box{<0,0,-0.012700><0.246730,0.035000,0.012700> rotate<0,-71.075686,0> translate<101.000000,0.000000,30.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,0.000000,30.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.080000,0.000000,30.233400>}
box{<0,0,-0.012700><0.278344,0.035000,0.012700> rotate<0,73.291975,0> translate<101.000000,0.000000,30.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<99.000000,-1.535000,26.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.500000,-1.535000,28.500000>}
box{<0,0,-0.012700><3.535534,0.035000,0.012700> rotate<0,-44.997030,0> translate<99.000000,-1.535000,26.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.500000,-1.535000,45.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.500000,-1.535000,44.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,44.997030,0> translate<100.500000,-1.535000,45.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.500000,-1.535000,47.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.500000,-1.535000,46.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,44.997030,0> translate<100.500000,-1.535000,47.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.500000,-1.535000,49.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.500000,-1.535000,48.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,44.997030,0> translate<100.500000,-1.535000,49.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.500000,-1.535000,51.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.500000,-1.535000,50.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,44.997030,0> translate<100.500000,-1.535000,51.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.500000,-1.535000,53.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.500000,-1.535000,52.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,44.997030,0> translate<100.500000,-1.535000,53.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.500000,-1.535000,44.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.000000,-1.535000,44.000000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<101.500000,-1.535000,44.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.500000,-1.535000,46.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.000000,-1.535000,46.000000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<101.500000,-1.535000,46.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.500000,-1.535000,48.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.000000,-1.535000,48.000000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<101.500000,-1.535000,48.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.500000,-1.535000,50.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.000000,-1.535000,50.000000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<101.500000,-1.535000,50.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.500000,-1.535000,52.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.000000,-1.535000,52.000000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<101.500000,-1.535000,52.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,0.000000,52.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.000000,0.000000,53.500000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,-44.997030,0> translate<101.000000,0.000000,52.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.000000,0.000000,55.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.000000,0.000000,55.000000>}
box{<0,0,-0.012700><2.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<100.000000,0.000000,55.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.000000,0.000000,55.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.000000,0.000000,55.000000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<102.000000,0.000000,55.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<83.500000,0.000000,59.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.000000,0.000000,59.000000>}
box{<0,0,-0.012700><18.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<83.500000,0.000000,59.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.000000,0.000000,58.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.000000,0.000000,59.000000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,90.000000,0> translate<102.000000,0.000000,59.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,0.000000,64.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.000000,0.000000,65.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,-44.997030,0> translate<101.000000,0.000000,64.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.000000,-1.535000,44.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.140000,-1.535000,43.880000>}
box{<0,0,-0.012700><0.184391,0.035000,0.012700> rotate<0,40.598615,0> translate<102.000000,-1.535000,44.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.000000,-1.535000,46.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.140000,-1.535000,45.880000>}
box{<0,0,-0.012700><0.184391,0.035000,0.012700> rotate<0,40.598615,0> translate<102.000000,-1.535000,46.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.000000,-1.535000,48.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.140000,-1.535000,47.880000>}
box{<0,0,-0.012700><0.184391,0.035000,0.012700> rotate<0,40.598615,0> translate<102.000000,-1.535000,48.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.000000,-1.535000,50.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.140000,-1.535000,49.880000>}
box{<0,0,-0.012700><0.184391,0.035000,0.012700> rotate<0,40.598615,0> translate<102.000000,-1.535000,50.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.000000,-1.535000,52.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.140000,-1.535000,51.880000>}
box{<0,0,-0.012700><0.184391,0.035000,0.012700> rotate<0,40.598615,0> translate<102.000000,-1.535000,52.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.000000,0.000000,53.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.140000,0.000000,53.880000>}
box{<0,0,-0.012700><0.404969,0.035000,0.012700> rotate<0,-69.770536,0> translate<102.000000,0.000000,53.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.000000,0.000000,55.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.140000,0.000000,55.880000>}
box{<0,0,-0.012700><0.404969,0.035000,0.012700> rotate<0,-69.770536,0> translate<102.000000,0.000000,55.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.000000,0.000000,58.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.140000,0.000000,57.880000>}
box{<0,0,-0.012700><0.184391,0.035000,0.012700> rotate<0,40.598615,0> translate<102.000000,0.000000,58.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.350000,0.000000,24.086600>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.500000,0.000000,24.500000>}
box{<0,0,-0.012700><0.439772,0.035000,0.012700> rotate<0,-70.052342,0> translate<102.350000,0.000000,24.086600> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.500000,0.000000,28.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.500000,0.000000,29.500000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,-44.997030,0> translate<101.500000,0.000000,28.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.500000,0.000000,30.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.500000,0.000000,29.500000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<102.500000,0.000000,29.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.350000,0.000000,30.233400>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.500000,0.000000,30.000000>}
box{<0,0,-0.012700><0.277445,0.035000,0.012700> rotate<0,57.268439,0> translate<102.350000,0.000000,30.233400> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.500000,0.000000,57.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.500000,0.000000,57.000000>}
box{<0,0,-0.012700><2.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<100.500000,0.000000,57.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.140000,-1.535000,59.880000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.500000,-1.535000,60.000000>}
box{<0,0,-0.012700><0.379473,0.035000,0.012700> rotate<0,-18.433732,0> translate<102.140000,-1.535000,59.880000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.140000,-1.535000,61.880000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.500000,-1.535000,62.000000>}
box{<0,0,-0.012700><0.379473,0.035000,0.012700> rotate<0,-18.433732,0> translate<102.140000,-1.535000,61.880000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,0.000000,63.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.500000,0.000000,63.000000>}
box{<0,0,-0.012700><1.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<101.000000,0.000000,63.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.140000,0.000000,63.880000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.500000,0.000000,64.000000>}
box{<0,0,-0.012700><0.379473,0.035000,0.012700> rotate<0,-18.433732,0> translate<102.140000,0.000000,63.880000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.140000,-1.535000,65.880000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.500000,-1.535000,66.000000>}
box{<0,0,-0.012700><0.379473,0.035000,0.012700> rotate<0,-18.433732,0> translate<102.140000,-1.535000,65.880000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.140000,-1.535000,67.880000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.500000,-1.535000,68.000000>}
box{<0,0,-0.012700><0.379473,0.035000,0.012700> rotate<0,-18.433732,0> translate<102.140000,-1.535000,67.880000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.140000,-1.535000,69.880000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.500000,-1.535000,69.500000>}
box{<0,0,-0.012700><0.523450,0.035000,0.012700> rotate<0,46.545086,0> translate<102.140000,-1.535000,69.880000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.140000,-1.535000,71.880000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.500000,-1.535000,71.500000>}
box{<0,0,-0.012700><0.523450,0.035000,0.012700> rotate<0,46.545086,0> translate<102.140000,-1.535000,71.880000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.140000,0.000000,73.880000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.500000,0.000000,73.500000>}
box{<0,0,-0.012700><0.523450,0.035000,0.012700> rotate<0,46.545086,0> translate<102.140000,0.000000,73.880000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<24.500000,-1.535000,23.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<103.000000,-1.535000,23.500000>}
box{<0,0,-0.012700><78.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<24.500000,-1.535000,23.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.500000,0.000000,24.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<103.000000,0.000000,24.500000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<102.500000,0.000000,24.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<35.500000,-1.535000,25.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<103.000000,-1.535000,25.500000>}
box{<0,0,-0.012700><67.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<35.500000,-1.535000,25.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.500000,0.000000,57.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<103.000000,0.000000,57.500000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,-44.997030,0> translate<102.500000,0.000000,57.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<103.000000,0.000000,57.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<103.000000,0.000000,63.000000>}
box{<0,0,-0.012700><5.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<103.000000,0.000000,63.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.000000,0.000000,65.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<103.000000,0.000000,65.000000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<102.000000,0.000000,65.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<103.000000,0.000000,73.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<103.000000,0.000000,65.000000>}
box{<0,0,-0.012700><8.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<103.000000,0.000000,65.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.500000,0.000000,73.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<103.000000,0.000000,73.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<102.500000,0.000000,73.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<103.000000,0.000000,23.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<103.500000,0.000000,24.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,-44.997030,0> translate<103.000000,0.000000,23.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.500000,0.000000,64.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<103.500000,0.000000,65.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,-44.997030,0> translate<102.500000,0.000000,64.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.500000,-1.535000,66.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<103.500000,-1.535000,66.000000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<102.500000,-1.535000,66.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<103.500000,0.000000,65.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<103.500000,0.000000,73.000000>}
box{<0,0,-0.012700><8.000000,0.035000,0.012700> rotate<0,90.000000,0> translate<103.500000,0.000000,73.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<103.500000,0.000000,24.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<103.620000,0.000000,24.086600>}
box{<0,0,-0.012700><0.147985,0.035000,0.012700> rotate<0,-35.814364,0> translate<103.500000,0.000000,24.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<103.500000,0.000000,30.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<103.620000,0.000000,30.233400>}
box{<0,0,-0.012700><0.292362,0.035000,0.012700> rotate<0,65.762553,0> translate<103.500000,0.000000,30.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.500000,0.000000,63.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<104.000000,0.000000,64.500000>}
box{<0,0,-0.012700><2.121320,0.035000,0.012700> rotate<0,-44.997030,0> translate<102.500000,0.000000,63.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.500000,-1.535000,68.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<104.000000,-1.535000,68.000000>}
box{<0,0,-0.012700><1.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<102.500000,-1.535000,68.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.500000,-1.535000,71.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<104.000000,-1.535000,71.500000>}
box{<0,0,-0.012700><1.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<102.500000,-1.535000,71.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<104.000000,0.000000,64.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<104.000000,0.000000,72.500000>}
box{<0,0,-0.012700><8.000000,0.035000,0.012700> rotate<0,90.000000,0> translate<104.000000,0.000000,72.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<103.500000,-1.535000,66.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<104.500000,-1.535000,67.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,-44.997030,0> translate<103.500000,-1.535000,66.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<104.000000,-1.535000,68.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<104.500000,-1.535000,68.500000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,-44.997030,0> translate<104.000000,-1.535000,68.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.500000,-1.535000,69.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<104.500000,-1.535000,69.500000>}
box{<0,0,-0.012700><2.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<102.500000,-1.535000,69.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<104.000000,-1.535000,71.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<104.500000,-1.535000,71.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<104.000000,-1.535000,71.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<104.890000,0.000000,24.086600>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<105.000000,0.000000,24.500000>}
box{<0,0,-0.012700><0.427784,0.035000,0.012700> rotate<0,-75.094686,0> translate<104.890000,0.000000,24.086600> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<105.000000,0.000000,27.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<105.000000,0.000000,24.500000>}
box{<0,0,-0.012700><3.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<105.000000,0.000000,24.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,0.000000,27.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<105.000000,0.000000,27.500000>}
box{<0,0,-0.012700><4.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<101.000000,0.000000,27.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<105.000000,0.000000,30.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<105.000000,0.000000,27.500000>}
box{<0,0,-0.012700><2.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<105.000000,0.000000,27.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<104.890000,0.000000,30.233400>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<105.000000,0.000000,30.000000>}
box{<0,0,-0.012700><0.258022,0.035000,0.012700> rotate<0,64.761509,0> translate<104.890000,0.000000,30.233400> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.500000,-1.535000,62.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<105.000000,-1.535000,64.500000>}
box{<0,0,-0.012700><3.535534,0.035000,0.012700> rotate<0,-44.997030,0> translate<102.500000,-1.535000,62.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<103.000000,-1.535000,25.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<106.000000,-1.535000,28.500000>}
box{<0,0,-0.012700><4.242641,0.035000,0.012700> rotate<0,-44.997030,0> translate<103.000000,-1.535000,25.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<106.000000,0.000000,30.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<106.000000,0.000000,28.500000>}
box{<0,0,-0.012700><1.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<106.000000,0.000000,28.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,-1.535000,45.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<106.000000,-1.535000,45.000000>}
box{<0,0,-0.012700><5.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<101.000000,-1.535000,45.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<102.500000,-1.535000,60.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<106.000000,-1.535000,63.500000>}
box{<0,0,-0.012700><4.949747,0.035000,0.012700> rotate<0,-44.997030,0> translate<102.500000,-1.535000,60.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<106.000000,0.000000,24.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<106.160000,0.000000,24.086600>}
box{<0,0,-0.012700><0.443283,0.035000,0.012700> rotate<0,68.837308,0> translate<106.000000,0.000000,24.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<106.000000,0.000000,30.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<106.160000,0.000000,30.233400>}
box{<0,0,-0.012700><0.282976,0.035000,0.012700> rotate<0,-55.564977,0> translate<106.000000,0.000000,30.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,-1.535000,47.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<106.500000,-1.535000,47.000000>}
box{<0,0,-0.012700><5.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<101.000000,-1.535000,47.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,-1.535000,57.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<106.500000,-1.535000,57.000000>}
box{<0,0,-0.012700><5.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<101.000000,-1.535000,57.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<106.500000,-1.535000,71.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<106.500000,-1.535000,62.500000>}
box{<0,0,-0.012700><8.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<106.500000,-1.535000,62.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<99.000000,0.000000,22.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<107.000000,0.000000,22.000000>}
box{<0,0,-0.012700><8.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<99.000000,0.000000,22.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<103.500000,0.000000,30.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<107.000000,0.000000,34.000000>}
box{<0,0,-0.012700><4.949747,0.035000,0.012700> rotate<0,-44.997030,0> translate<103.500000,0.000000,30.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<107.000000,0.000000,62.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<107.000000,0.000000,34.000000>}
box{<0,0,-0.012700><28.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<107.000000,0.000000,34.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<106.500000,-1.535000,62.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<107.000000,-1.535000,62.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<106.500000,-1.535000,62.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<107.430000,0.000000,24.086600>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<107.500000,0.000000,24.500000>}
box{<0,0,-0.012700><0.419285,0.035000,0.012700> rotate<0,-80.384101,0> translate<107.430000,0.000000,24.086600> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<107.430000,0.000000,30.233400>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<107.500000,0.000000,30.500000>}
box{<0,0,-0.012700><0.275637,0.035000,0.012700> rotate<0,-75.283209,0> translate<107.430000,0.000000,30.233400> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<107.500000,0.000000,62.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<107.500000,0.000000,30.500000>}
box{<0,0,-0.012700><32.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<107.500000,0.000000,30.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,-1.535000,49.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<107.500000,-1.535000,49.000000>}
box{<0,0,-0.012700><6.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<101.000000,-1.535000,49.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,-1.535000,53.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<107.500000,-1.535000,53.000000>}
box{<0,0,-0.012700><6.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<101.000000,-1.535000,53.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<103.000000,0.000000,63.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<107.500000,0.000000,63.000000>}
box{<0,0,-0.012700><4.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<103.000000,0.000000,63.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<106.000000,-1.535000,45.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<108.000000,-1.535000,47.000000>}
box{<0,0,-0.012700><2.828427,0.035000,0.012700> rotate<0,-44.997030,0> translate<106.000000,-1.535000,45.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<106.500000,-1.535000,47.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<108.000000,-1.535000,48.500000>}
box{<0,0,-0.012700><2.121320,0.035000,0.012700> rotate<0,-44.997030,0> translate<106.500000,-1.535000,47.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<107.500000,-1.535000,49.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<108.000000,-1.535000,49.500000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,-44.997030,0> translate<107.500000,-1.535000,49.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<101.000000,-1.535000,51.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<108.000000,-1.535000,51.000000>}
box{<0,0,-0.012700><7.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<101.000000,-1.535000,51.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<107.500000,-1.535000,53.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<108.000000,-1.535000,52.500000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<107.500000,-1.535000,53.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<108.000000,0.000000,62.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<108.000000,0.000000,53.500000>}
box{<0,0,-0.012700><9.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<108.000000,0.000000,53.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<48.000000,-1.535000,55.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<108.000000,-1.535000,55.000000>}
box{<0,0,-0.012700><60.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<48.000000,-1.535000,55.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<107.500000,0.000000,63.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<108.000000,0.000000,62.500000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<107.500000,0.000000,63.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<106.500000,-1.535000,57.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<108.500000,-1.535000,55.000000>}
box{<0,0,-0.012700><2.828427,0.035000,0.012700> rotate<0,44.997030,0> translate<106.500000,-1.535000,57.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<103.000000,-1.535000,24.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<109.000000,-1.535000,30.500000>}
box{<0,0,-0.012700><8.485281,0.035000,0.012700> rotate<0,-44.997030,0> translate<103.000000,-1.535000,24.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<108.000000,-1.535000,55.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<110.000000,-1.535000,53.000000>}
box{<0,0,-0.012700><2.828427,0.035000,0.012700> rotate<0,44.997030,0> translate<108.000000,-1.535000,55.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<107.500000,-1.535000,62.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<110.000000,-1.535000,65.000000>}
box{<0,0,-0.012700><3.535534,0.035000,0.012700> rotate<0,-44.997030,0> translate<107.500000,-1.535000,62.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<107.000000,-1.535000,62.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<110.500000,-1.535000,66.000000>}
box{<0,0,-0.012700><4.949747,0.035000,0.012700> rotate<0,-44.997030,0> translate<107.000000,-1.535000,62.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<109.000000,-1.535000,30.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<116.500000,-1.535000,30.500000>}
box{<0,0,-0.012700><7.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<109.000000,-1.535000,30.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<78.000000,-1.535000,31.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<116.500000,-1.535000,31.000000>}
box{<0,0,-0.012700><38.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<78.000000,-1.535000,31.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<53.500000,-1.535000,43.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<117.000000,-1.535000,43.000000>}
box{<0,0,-0.012700><63.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<53.500000,-1.535000,43.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<106.000000,0.000000,24.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<119.000000,0.000000,37.500000>}
box{<0,0,-0.012700><18.384776,0.035000,0.012700> rotate<0,-44.997030,0> translate<106.000000,0.000000,24.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<53.000000,-1.535000,42.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<120.000000,-1.535000,42.500000>}
box{<0,0,-0.012700><67.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<53.000000,-1.535000,42.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<107.500000,0.000000,24.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<120.500000,0.000000,37.500000>}
box{<0,0,-0.012700><18.384776,0.035000,0.012700> rotate<0,-44.997030,0> translate<107.500000,0.000000,24.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<120.500000,0.000000,46.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<120.500000,0.000000,37.500000>}
box{<0,0,-0.012700><9.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<120.500000,0.000000,37.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<107.000000,0.000000,22.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.000000,0.000000,36.000000>}
box{<0,0,-0.012700><19.798990,0.035000,0.012700> rotate<0,-44.997030,0> translate<107.000000,0.000000,22.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<31.500000,-1.535000,42.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.000000,-1.535000,42.000000>}
box{<0,0,-0.012700><89.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<31.500000,-1.535000,42.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.000000,0.000000,36.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.000000,0.000000,45.500000>}
box{<0,0,-0.012700><9.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<121.000000,0.000000,45.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<119.000000,-1.535000,37.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.500000,-1.535000,37.500000>}
box{<0,0,-0.012700><2.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<119.000000,-1.535000,37.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<76.000000,-1.535000,38.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.500000,-1.535000,38.000000>}
box{<0,0,-0.012700><45.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<76.000000,-1.535000,38.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<28.000000,-1.535000,38.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.500000,-1.535000,38.500000>}
box{<0,0,-0.012700><93.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<28.000000,-1.535000,38.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<34.000000,-1.535000,41.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.500000,-1.535000,41.500000>}
box{<0,0,-0.012700><87.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<34.000000,-1.535000,41.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.000000,0.000000,45.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.500000,0.000000,46.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,-44.997030,0> translate<121.000000,0.000000,45.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<108.000000,0.000000,47.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.500000,0.000000,47.000000>}
box{<0,0,-0.012700><13.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<108.000000,0.000000,47.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<108.000000,0.000000,48.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.500000,0.000000,48.500000>}
box{<0,0,-0.012700><13.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<108.000000,0.000000,48.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<108.000000,0.000000,49.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.500000,0.000000,49.500000>}
box{<0,0,-0.012700><13.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<108.000000,0.000000,49.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<108.000000,0.000000,51.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.500000,0.000000,51.000000>}
box{<0,0,-0.012700><13.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<108.000000,0.000000,51.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<108.000000,0.000000,52.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.500000,0.000000,52.500000>}
box{<0,0,-0.012700><13.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<108.000000,0.000000,52.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<108.000000,0.000000,53.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.500000,0.000000,53.500000>}
box{<0,0,-0.012700><13.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<108.000000,0.000000,53.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<108.500000,0.000000,55.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.500000,0.000000,55.000000>}
box{<0,0,-0.012700><13.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<108.500000,0.000000,55.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.500000,0.000000,46.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.840000,0.000000,45.910000>}
box{<0,0,-0.012700><0.351710,0.035000,0.012700> rotate<0,14.825501,0> translate<121.500000,0.000000,46.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.500000,0.000000,47.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.840000,0.000000,47.180000>}
box{<0,0,-0.012700><0.384708,0.035000,0.012700> rotate<0,-27.895430,0> translate<121.500000,0.000000,47.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.500000,0.000000,48.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.840000,0.000000,48.450000>}
box{<0,0,-0.012700><0.343657,0.035000,0.012700> rotate<0,8.365334,0> translate<121.500000,0.000000,48.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.500000,0.000000,49.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.840000,0.000000,49.720000>}
box{<0,0,-0.012700><0.404969,0.035000,0.012700> rotate<0,-32.903071,0> translate<121.500000,0.000000,49.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.500000,0.000000,51.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.840000,0.000000,50.990000>}
box{<0,0,-0.012700><0.340147,0.035000,0.012700> rotate<0,1.684573,0> translate<121.500000,0.000000,51.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.500000,0.000000,52.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.840000,0.000000,52.260000>}
box{<0,0,-0.012700><0.416173,0.035000,0.012700> rotate<0,35.215269,0> translate<121.500000,0.000000,52.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.500000,0.000000,53.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.840000,0.000000,53.530000>}
box{<0,0,-0.012700><0.341321,0.035000,0.012700> rotate<0,-5.042118,0> translate<121.500000,0.000000,53.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.500000,0.000000,55.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.840000,0.000000,54.800000>}
box{<0,0,-0.012700><0.394462,0.035000,0.012700> rotate<0,30.463534,0> translate<121.500000,0.000000,55.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<106.000000,0.000000,63.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<122.000000,0.000000,63.500000>}
box{<0,0,-0.012700><16.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<106.000000,0.000000,63.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<105.000000,0.000000,64.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<122.000000,0.000000,64.500000>}
box{<0,0,-0.012700><17.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<105.000000,0.000000,64.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<104.500000,0.000000,67.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<122.000000,0.000000,67.000000>}
box{<0,0,-0.012700><17.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<104.500000,0.000000,67.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<104.500000,0.000000,69.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<122.000000,0.000000,69.500000>}
box{<0,0,-0.012700><17.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<104.500000,0.000000,69.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<104.500000,0.000000,71.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<122.000000,0.000000,71.000000>}
box{<0,0,-0.012700><17.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<104.500000,0.000000,71.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<104.000000,0.000000,72.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<122.000000,0.000000,72.500000>}
box{<0,0,-0.012700><18.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<104.000000,0.000000,72.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<75.500000,0.000000,75.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<122.000000,0.000000,75.500000>}
box{<0,0,-0.012700><46.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<75.500000,0.000000,75.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<122.000000,0.000000,63.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<122.240000,0.000000,63.420000>}
box{<0,0,-0.012700><0.252982,0.035000,0.012700> rotate<0,18.433732,0> translate<122.000000,0.000000,63.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<122.000000,0.000000,64.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<122.240000,0.000000,64.690000>}
box{<0,0,-0.012700><0.306105,0.035000,0.012700> rotate<0,-38.364953,0> translate<122.000000,0.000000,64.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<122.000000,0.000000,67.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<122.240000,0.000000,67.230000>}
box{<0,0,-0.012700><0.332415,0.035000,0.012700> rotate<0,-43.778235,0> translate<122.000000,0.000000,67.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<104.500000,0.000000,68.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<122.240000,0.000000,68.500000>}
box{<0,0,-0.012700><17.740000,0.035000,0.012700> rotate<0,0.000000,0> translate<104.500000,0.000000,68.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<122.000000,0.000000,69.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<122.240000,0.000000,69.770000>}
box{<0,0,-0.012700><0.361248,0.035000,0.012700> rotate<0,-48.363269,0> translate<122.000000,0.000000,69.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<122.000000,0.000000,71.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<122.240000,0.000000,71.040000>}
box{<0,0,-0.012700><0.243311,0.035000,0.012700> rotate<0,-9.461698,0> translate<122.000000,0.000000,71.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<122.000000,0.000000,72.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<122.240000,0.000000,72.310000>}
box{<0,0,-0.012700><0.306105,0.035000,0.012700> rotate<0,38.364953,0> translate<122.000000,0.000000,72.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<78.500000,-1.535000,40.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<122.500000,-1.535000,40.500000>}
box{<0,0,-0.012700><44.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<78.500000,-1.535000,40.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<30.000000,-1.535000,41.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<122.500000,-1.535000,41.000000>}
box{<0,0,-0.012700><92.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<30.000000,-1.535000,41.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<122.240000,0.000000,65.960000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<122.500000,0.000000,66.000000>}
box{<0,0,-0.012700><0.263059,0.035000,0.012700> rotate<0,-8.745585,0> translate<122.240000,0.000000,65.960000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<122.500000,0.000000,66.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<123.500000,0.000000,67.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,-44.997030,0> translate<122.500000,0.000000,66.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<123.500000,0.000000,73.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<123.500000,0.000000,67.000000>}
box{<0,0,-0.012700><6.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<123.500000,0.000000,67.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<103.500000,0.000000,73.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<123.500000,0.000000,73.000000>}
box{<0,0,-0.012700><20.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<103.500000,0.000000,73.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<123.500000,0.000000,74.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<123.500000,0.000000,73.500000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<123.500000,0.000000,73.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<122.000000,0.000000,75.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<123.500000,0.000000,74.000000>}
box{<0,0,-0.012700><2.121320,0.035000,0.012700> rotate<0,44.997030,0> translate<122.000000,0.000000,75.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<120.500000,0.000000,46.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<126.000000,0.000000,46.500000>}
box{<0,0,-0.012700><5.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<120.500000,0.000000,46.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<126.000000,0.000000,53.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<126.000000,0.000000,46.500000>}
box{<0,0,-0.012700><7.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<126.000000,0.000000,46.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<117.000000,-1.535000,43.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<126.500000,-1.535000,52.500000>}
box{<0,0,-0.012700><13.435029,0.035000,0.012700> rotate<0,-44.997030,0> translate<117.000000,-1.535000,43.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.000000,-1.535000,42.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<127.500000,-1.535000,48.500000>}
box{<0,0,-0.012700><9.192388,0.035000,0.012700> rotate<0,-44.997030,0> translate<121.000000,-1.535000,42.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<120.000000,-1.535000,42.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<127.500000,-1.535000,50.000000>}
box{<0,0,-0.012700><10.606602,0.035000,0.012700> rotate<0,-44.997030,0> translate<120.000000,-1.535000,42.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<110.000000,-1.535000,53.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<127.500000,-1.535000,53.000000>}
box{<0,0,-0.012700><17.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<110.000000,-1.535000,53.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<126.500000,0.000000,52.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<127.500000,0.000000,53.500000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,-44.997030,0> translate<126.500000,0.000000,52.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<126.000000,0.000000,53.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<127.500000,0.000000,55.000000>}
box{<0,0,-0.012700><2.121320,0.035000,0.012700> rotate<0,-44.997030,0> translate<126.000000,0.000000,53.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<123.500000,0.000000,73.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<127.500000,0.000000,73.500000>}
box{<0,0,-0.012700><4.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<123.500000,0.000000,73.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<127.500000,0.000000,55.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<127.500000,0.000000,73.500000>}
box{<0,0,-0.012700><18.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<127.500000,0.000000,73.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<122.500000,-1.535000,40.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<128.000000,-1.535000,46.000000>}
box{<0,0,-0.012700><7.778175,0.035000,0.012700> rotate<0,-44.997030,0> translate<122.500000,-1.535000,40.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<128.000000,-1.535000,62.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<128.000000,-1.535000,46.000000>}
box{<0,0,-0.012700><16.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<128.000000,-1.535000,46.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<107.000000,-1.535000,62.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<128.000000,-1.535000,62.000000>}
box{<0,0,-0.012700><21.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<107.000000,-1.535000,62.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<110.000000,-1.535000,65.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<128.000000,-1.535000,65.000000>}
box{<0,0,-0.012700><18.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<110.000000,-1.535000,65.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<110.500000,-1.535000,66.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<128.000000,-1.535000,66.000000>}
box{<0,0,-0.012700><17.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<110.500000,-1.535000,66.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<128.000000,0.000000,68.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<128.000000,0.000000,70.500000>}
box{<0,0,-0.012700><2.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<128.000000,0.000000,70.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<106.500000,-1.535000,71.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<128.000000,-1.535000,71.000000>}
box{<0,0,-0.012700><21.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<106.500000,-1.535000,71.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.500000,-1.535000,38.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<128.500000,-1.535000,45.000000>}
box{<0,0,-0.012700><9.899495,0.035000,0.012700> rotate<0,-44.997030,0> translate<121.500000,-1.535000,38.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<128.500000,-1.535000,68.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<128.500000,-1.535000,45.000000>}
box{<0,0,-0.012700><23.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<128.500000,-1.535000,45.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<122.500000,0.000000,41.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<128.500000,0.000000,47.000000>}
box{<0,0,-0.012700><8.485281,0.035000,0.012700> rotate<0,-44.997030,0> translate<122.500000,0.000000,41.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.500000,0.000000,41.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<128.500000,0.000000,48.500000>}
box{<0,0,-0.012700><9.899495,0.035000,0.012700> rotate<0,-44.997030,0> translate<121.500000,0.000000,41.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<127.500000,0.000000,50.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<128.500000,0.000000,51.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,-44.997030,0> translate<127.500000,0.000000,50.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<127.500000,0.000000,55.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<128.500000,0.000000,56.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,-44.997030,0> translate<127.500000,0.000000,55.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<100.000000,-1.535000,73.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<128.500000,-1.535000,73.000000>}
box{<0,0,-0.012700><28.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<100.000000,-1.535000,73.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.500000,-1.535000,37.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,-1.535000,45.000000>}
box{<0,0,-0.012700><10.606602,0.035000,0.012700> rotate<0,-44.997030,0> translate<121.500000,-1.535000,37.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,-1.535000,64.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,-1.535000,45.000000>}
box{<0,0,-0.012700><19.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<129.000000,-1.535000,45.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<121.500000,0.000000,38.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,0.000000,46.000000>}
box{<0,0,-0.012700><10.606602,0.035000,0.012700> rotate<0,-44.997030,0> translate<121.500000,0.000000,38.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<128.500000,0.000000,47.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,0.000000,47.000000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<128.500000,0.000000,47.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<128.500000,0.000000,48.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,0.000000,48.500000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<128.500000,0.000000,48.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<127.500000,0.000000,48.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,0.000000,50.000000>}
box{<0,0,-0.012700><2.121320,0.035000,0.012700> rotate<0,-44.997030,0> translate<127.500000,0.000000,48.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<128.500000,0.000000,51.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,0.000000,51.000000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<128.500000,0.000000,51.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<127.500000,0.000000,53.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,0.000000,53.000000>}
box{<0,0,-0.012700><1.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<127.500000,0.000000,53.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,0.000000,52.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,0.000000,53.000000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<129.000000,0.000000,53.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<127.500000,0.000000,53.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,0.000000,53.500000>}
box{<0,0,-0.012700><1.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<127.500000,0.000000,53.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<128.500000,0.000000,56.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,0.000000,56.000000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<128.500000,0.000000,56.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,0.000000,64.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,0.000000,64.000000>}
box{<0,0,-0.012700><0.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<129.000000,0.000000,64.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<128.000000,0.000000,65.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,0.000000,66.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,-44.997030,0> translate<128.000000,0.000000,65.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<128.000000,0.000000,66.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,0.000000,67.000000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,-44.997030,0> translate<128.000000,0.000000,66.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<128.000000,0.000000,71.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,0.000000,71.000000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<128.000000,0.000000,71.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<128.500000,0.000000,73.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,0.000000,72.500000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,44.997030,0> translate<128.500000,0.000000,73.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<127.500000,0.000000,73.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,0.000000,73.500000>}
box{<0,0,-0.012700><1.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<127.500000,0.000000,73.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,0.000000,46.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.040000,0.000000,45.910000>}
box{<0,0,-0.012700><0.098489,0.035000,0.012700> rotate<0,66.033153,0> translate<129.000000,0.000000,46.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,0.000000,47.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.040000,0.000000,47.180000>}
box{<0,0,-0.012700><0.184391,0.035000,0.012700> rotate<0,-77.466079,0> translate<129.000000,0.000000,47.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,0.000000,48.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.040000,0.000000,48.450000>}
box{<0,0,-0.012700><0.064031,0.035000,0.012700> rotate<0,51.336803,0> translate<129.000000,0.000000,48.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,0.000000,50.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.040000,0.000000,49.720000>}
box{<0,0,-0.012700><0.282843,0.035000,0.012700> rotate<0,81.864495,0> translate<129.000000,0.000000,50.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,0.000000,51.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.040000,0.000000,50.990000>}
box{<0,0,-0.012700><0.041231,0.035000,0.012700> rotate<0,14.035317,0> translate<129.000000,0.000000,51.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,0.000000,52.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.040000,0.000000,52.260000>}
box{<0,0,-0.012700><0.243311,0.035000,0.012700> rotate<0,80.532363,0> translate<129.000000,0.000000,52.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,0.000000,53.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.040000,0.000000,53.530000>}
box{<0,0,-0.012700><0.050000,0.035000,0.012700> rotate<0,-36.867464,0> translate<129.000000,0.000000,53.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,0.000000,56.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.040000,0.000000,56.070000>}
box{<0,0,-0.012700><0.080623,0.035000,0.012700> rotate<0,-60.251142,0> translate<129.000000,0.000000,56.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,0.000000,64.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.440000,0.000000,64.690000>}
box{<0,0,-0.012700><0.479270,0.035000,0.012700> rotate<0,-23.354023,0> translate<129.000000,0.000000,64.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,0.000000,66.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.440000,0.000000,65.960000>}
box{<0,0,-0.012700><0.441814,0.035000,0.012700> rotate<0,5.194086,0> translate<129.000000,0.000000,66.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,0.000000,67.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.440000,0.000000,67.230000>}
box{<0,0,-0.012700><0.496488,0.035000,0.012700> rotate<0,-27.595475,0> translate<129.000000,0.000000,67.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,0.000000,71.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.440000,0.000000,71.040000>}
box{<0,0,-0.012700><0.441814,0.035000,0.012700> rotate<0,-5.194086,0> translate<129.000000,0.000000,71.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,0.000000,72.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.440000,0.000000,72.310000>}
box{<0,0,-0.012700><0.479270,0.035000,0.012700> rotate<0,23.354023,0> translate<129.000000,0.000000,72.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.000000,0.000000,73.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.440000,0.000000,73.580000>}
box{<0,0,-0.012700><0.447214,0.035000,0.012700> rotate<0,-10.304166,0> translate<129.000000,0.000000,73.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<116.500000,-1.535000,30.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.500000,-1.535000,43.500000>}
box{<0,0,-0.012700><18.384776,0.035000,0.012700> rotate<0,-44.997030,0> translate<116.500000,-1.535000,30.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.500000,-1.535000,62.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.500000,-1.535000,43.500000>}
box{<0,0,-0.012700><19.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<129.500000,-1.535000,43.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.040000,0.000000,54.800000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.500000,0.000000,55.000000>}
box{<0,0,-0.012700><0.501597,0.035000,0.012700> rotate<0,-23.497015,0> translate<129.040000,0.000000,54.800000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.500000,0.000000,63.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.500000,0.000000,62.500000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,-90.000000,0> translate<129.500000,0.000000,62.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.440000,0.000000,63.420000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.500000,0.000000,63.500000>}
box{<0,0,-0.012700><0.100000,0.035000,0.012700> rotate<0,-53.126596,0> translate<129.440000,0.000000,63.420000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.440000,0.000000,69.770000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.500000,0.000000,69.500000>}
box{<0,0,-0.012700><0.276586,0.035000,0.012700> rotate<0,77.466079,0> translate<129.440000,0.000000,69.770000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.500000,0.000000,69.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<130.500000,0.000000,69.500000>}
box{<0,0,-0.012700><1.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<129.500000,0.000000,69.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<128.000000,0.000000,70.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<130.500000,0.000000,70.500000>}
box{<0,0,-0.012700><2.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<128.000000,0.000000,70.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.500000,0.000000,55.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<131.000000,0.000000,56.500000>}
box{<0,0,-0.012700><2.121320,0.035000,0.012700> rotate<0,-44.997030,0> translate<129.500000,0.000000,55.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<128.000000,0.000000,68.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<131.000000,0.000000,68.000000>}
box{<0,0,-0.012700><3.000000,0.035000,0.012700> rotate<0,0.000000,0> translate<128.000000,0.000000,68.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<131.000000,0.000000,56.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<131.000000,0.000000,68.000000>}
box{<0,0,-0.012700><11.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<131.000000,0.000000,68.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<128.500000,-1.535000,68.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<131.000000,-1.535000,68.500000>}
box{<0,0,-0.012700><2.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<128.500000,-1.535000,68.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<129.440000,0.000000,68.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<131.000000,0.000000,68.500000>}
box{<0,0,-0.012700><1.560000,0.035000,0.012700> rotate<0,0.000000,0> translate<129.440000,0.000000,68.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<130.500000,0.000000,70.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<131.000000,0.000000,71.000000>}
box{<0,0,-0.012700><0.707107,0.035000,0.012700> rotate<0,-44.997030,0> translate<130.500000,0.000000,70.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<50.500000,0.000000,77.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<131.000000,0.000000,77.500000>}
box{<0,0,-0.012700><80.500000,0.035000,0.012700> rotate<0,0.000000,0> translate<50.500000,0.000000,77.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<131.000000,0.000000,71.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<131.000000,0.000000,77.500000>}
box{<0,0,-0.012700><6.500000,0.035000,0.012700> rotate<0,90.000000,0> translate<131.000000,0.000000,77.500000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<116.500000,0.000000,31.000000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<131.500000,0.000000,46.000000>}
box{<0,0,-0.012700><21.213203,0.035000,0.012700> rotate<0,-44.997030,0> translate<116.500000,0.000000,31.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<131.500000,0.000000,68.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<131.500000,0.000000,46.000000>}
box{<0,0,-0.012700><22.500000,0.035000,0.012700> rotate<0,-90.000000,0> translate<131.500000,0.000000,46.000000> }
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<130.500000,0.000000,69.500000>}
cylinder{<0,0,0><0,0.035000,0>0.012700 translate<131.500000,0.000000,68.500000>}
box{<0,0,-0.012700><1.414214,0.035000,0.012700> rotate<0,44.997030,0> translate<130.500000,0.000000,69.500000> }
//Text
//Rect
union{
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polygons
texture{col_pol}
}
#end
union{
cylinder{<102.140000,0.038000,43.880000><102.140000,-1.538000,43.880000>0.450000}
cylinder{<100.140000,0.038000,43.880000><100.140000,-1.538000,43.880000>0.450000}
cylinder{<102.140000,0.038000,45.880000><102.140000,-1.538000,45.880000>0.450000}
cylinder{<100.140000,0.038000,45.880000><100.140000,-1.538000,45.880000>0.450000}
cylinder{<102.140000,0.038000,47.880000><102.140000,-1.538000,47.880000>0.450000}
cylinder{<100.140000,0.038000,47.880000><100.140000,-1.538000,47.880000>0.450000}
cylinder{<102.140000,0.038000,49.880000><102.140000,-1.538000,49.880000>0.450000}
cylinder{<100.140000,0.038000,49.880000><100.140000,-1.538000,49.880000>0.450000}
cylinder{<102.140000,0.038000,51.880000><102.140000,-1.538000,51.880000>0.450000}
cylinder{<100.140000,0.038000,51.880000><100.140000,-1.538000,51.880000>0.450000}
cylinder{<102.140000,0.038000,53.880000><102.140000,-1.538000,53.880000>0.450000}
cylinder{<100.140000,0.038000,53.880000><100.140000,-1.538000,53.880000>0.450000}
cylinder{<102.140000,0.038000,55.880000><102.140000,-1.538000,55.880000>0.450000}
cylinder{<100.140000,0.038000,55.880000><100.140000,-1.538000,55.880000>0.450000}
cylinder{<102.140000,0.038000,57.880000><102.140000,-1.538000,57.880000>0.450000}
cylinder{<100.140000,0.038000,57.880000><100.140000,-1.538000,57.880000>0.450000}
cylinder{<102.140000,0.038000,59.880000><102.140000,-1.538000,59.880000>0.450000}
cylinder{<100.140000,0.038000,59.880000><100.140000,-1.538000,59.880000>0.450000}
cylinder{<102.140000,0.038000,61.880000><102.140000,-1.538000,61.880000>0.450000}
cylinder{<100.140000,0.038000,61.880000><100.140000,-1.538000,61.880000>0.450000}
cylinder{<102.140000,0.038000,63.880000><102.140000,-1.538000,63.880000>0.450000}
cylinder{<100.140000,0.038000,63.880000><100.140000,-1.538000,63.880000>0.450000}
cylinder{<102.140000,0.038000,65.880000><102.140000,-1.538000,65.880000>0.450000}
cylinder{<100.140000,0.038000,65.880000><100.140000,-1.538000,65.880000>0.450000}
cylinder{<102.140000,0.038000,67.880000><102.140000,-1.538000,67.880000>0.450000}
cylinder{<100.140000,0.038000,67.880000><100.140000,-1.538000,67.880000>0.450000}
cylinder{<102.140000,0.038000,69.880000><102.140000,-1.538000,69.880000>0.450000}
cylinder{<100.140000,0.038000,69.880000><100.140000,-1.538000,69.880000>0.450000}
cylinder{<102.140000,0.038000,71.880000><102.140000,-1.538000,71.880000>0.450000}
cylinder{<100.140000,0.038000,71.880000><100.140000,-1.538000,71.880000>0.450000}
cylinder{<102.140000,0.038000,73.880000><102.140000,-1.538000,73.880000>0.450000}
cylinder{<100.140000,0.038000,73.880000><100.140000,-1.538000,73.880000>0.450000}
//Holes(fast)/Vias
cylinder{<76.000000,0.038000,47.500000><76.000000,-1.538000,47.500000>0.025400 }
cylinder{<76.000000,0.038000,53.500000><76.000000,-1.538000,53.500000>0.025400 }
cylinder{<23.500000,0.038000,18.500000><23.500000,-1.538000,18.500000>0.025400 }
cylinder{<57.500000,0.038000,33.000000><57.500000,-1.538000,33.000000>0.025400 }
cylinder{<34.000000,0.038000,20.500000><34.000000,-1.538000,20.500000>0.025400 }
cylinder{<37.000000,0.038000,21.500000><37.000000,-1.538000,21.500000>0.025400 }
cylinder{<24.000000,0.038000,19.000000><24.000000,-1.538000,19.000000>0.025400 }
cylinder{<37.000000,0.038000,18.500000><37.000000,-1.538000,18.500000>0.025400 }
cylinder{<24.000000,0.038000,19.500000><24.000000,-1.538000,19.500000>0.025400 }
cylinder{<33.500000,0.038000,19.000000><33.500000,-1.538000,19.000000>0.025400 }
cylinder{<39.500000,0.038000,16.500000><39.500000,-1.538000,16.500000>0.025400 }
cylinder{<24.000000,0.038000,21.000000><24.000000,-1.538000,21.000000>0.025400 }
cylinder{<31.000000,0.038000,20.500000><31.000000,-1.538000,20.500000>0.025400 }
cylinder{<69.000000,0.038000,18.500000><69.000000,-1.538000,18.500000>0.025400 }
cylinder{<24.000000,0.038000,21.500000><24.000000,-1.538000,21.500000>0.025400 }
cylinder{<31.000000,0.038000,21.500000><31.000000,-1.538000,21.500000>0.025400 }
cylinder{<73.000000,0.038000,22.000000><73.000000,-1.538000,22.000000>0.025400 }
cylinder{<24.000000,0.038000,22.000000><24.000000,-1.538000,22.000000>0.025400 }
cylinder{<31.000000,0.038000,22.000000><31.000000,-1.538000,22.000000>0.025400 }
cylinder{<69.000000,0.038000,21.000000><69.000000,-1.538000,21.000000>0.025400 }
cylinder{<34.000000,0.038000,22.500000><34.000000,-1.538000,22.500000>0.025400 }
cylinder{<99.500000,0.038000,22.500000><99.500000,-1.538000,22.500000>0.025400 }
cylinder{<24.000000,0.038000,24.000000><24.000000,-1.538000,24.000000>0.025400 }
cylinder{<103.000000,0.038000,23.500000><103.000000,-1.538000,23.500000>0.025400 }
cylinder{<34.000000,0.038000,24.000000><34.000000,-1.538000,24.000000>0.025400 }
cylinder{<106.000000,0.038000,28.500000><106.000000,-1.538000,28.500000>0.025400 }
cylinder{<24.000000,0.038000,26.000000><24.000000,-1.538000,26.000000>0.025400 }
cylinder{<101.500000,0.038000,28.500000><101.500000,-1.538000,28.500000>0.025400 }
cylinder{<24.000000,0.038000,26.500000><24.000000,-1.538000,26.500000>0.025400 }
cylinder{<31.000000,0.038000,26.500000><31.000000,-1.538000,26.500000>0.025400 }
cylinder{<70.500000,0.038000,30.000000><70.500000,-1.538000,30.000000>0.025400 }
cylinder{<24.000000,0.038000,28.000000><24.000000,-1.538000,28.000000>0.025400 }
cylinder{<31.000000,0.038000,27.000000><31.000000,-1.538000,27.000000>0.025400 }
cylinder{<74.000000,0.038000,31.500000><74.000000,-1.538000,31.500000>0.025400 }
cylinder{<77.000000,0.038000,37.500000><77.000000,-1.538000,37.500000>0.025400 }
cylinder{<34.500000,0.038000,35.000000><34.500000,-1.538000,35.000000>0.025400 }
cylinder{<90.000000,0.038000,54.500000><90.000000,-1.538000,54.500000>0.025400 }
cylinder{<77.000000,0.038000,31.500000><77.000000,-1.538000,31.500000>0.025400 }
cylinder{<100.500000,0.038000,31.500000><100.500000,-1.538000,31.500000>0.025400 }
cylinder{<69.500000,0.038000,52.000000><69.500000,-1.538000,52.000000>0.025400 }
cylinder{<73.000000,0.038000,54.000000><73.000000,-1.538000,54.000000>0.025400 }
cylinder{<56.000000,0.038000,51.500000><56.000000,-1.538000,51.500000>0.025400 }
cylinder{<73.000000,0.038000,51.500000><73.000000,-1.538000,51.500000>0.025400 }
cylinder{<51.000000,0.038000,46.000000><51.000000,-1.538000,46.000000>0.025400 }
cylinder{<73.000000,0.038000,50.500000><73.000000,-1.538000,50.500000>0.025400 }
cylinder{<71.500000,0.038000,44.000000><71.500000,-1.538000,44.000000>0.025400 }
cylinder{<73.000000,0.038000,45.500000><73.000000,-1.538000,45.500000>0.025400 }
cylinder{<103.000000,0.038000,24.500000><103.000000,-1.538000,24.500000>0.025400 }
cylinder{<129.500000,0.038000,62.500000><129.500000,-1.538000,62.500000>0.025400 }
cylinder{<119.000000,0.038000,37.500000><119.000000,-1.538000,37.500000>0.025400 }
cylinder{<129.000000,0.038000,64.000000><129.000000,-1.538000,64.000000>0.025400 }
cylinder{<107.500000,0.038000,62.500000><107.500000,-1.538000,62.500000>0.025400 }
cylinder{<128.000000,0.038000,65.000000><128.000000,-1.538000,65.000000>0.025400 }
cylinder{<71.500000,0.038000,55.500000><71.500000,-1.538000,55.500000>0.025400 }
cylinder{<128.500000,0.038000,73.000000><128.500000,-1.538000,73.000000>0.025400 }
cylinder{<78.500000,0.038000,40.500000><78.500000,-1.538000,40.500000>0.025400 }
cylinder{<128.000000,0.038000,71.000000><128.000000,-1.538000,71.000000>0.025400 }
cylinder{<78.000000,0.038000,31.000000><78.000000,-1.538000,31.000000>0.025400 }
cylinder{<116.500000,0.038000,31.000000><116.500000,-1.538000,31.000000>0.025400 }
cylinder{<73.500000,0.038000,35.500000><73.500000,-1.538000,35.500000>0.025400 }
cylinder{<131.000000,0.038000,68.500000><131.000000,-1.538000,68.500000>0.025400 }
cylinder{<107.000000,0.038000,62.500000><107.000000,-1.538000,62.500000>0.025400 }
cylinder{<128.000000,0.038000,66.000000><128.000000,-1.538000,66.000000>0.025400 }
cylinder{<12.500000,0.038000,56.000000><12.500000,-1.538000,56.000000>0.025400 }
cylinder{<22.500000,0.038000,46.000000><22.500000,-1.538000,46.000000>0.025400 }
cylinder{<13.000000,0.038000,71.000000><13.000000,-1.538000,71.000000>0.025400 }
cylinder{<22.000000,0.038000,47.000000><22.000000,-1.538000,47.000000>0.025400 }
cylinder{<27.000000,0.038000,38.500000><27.000000,-1.538000,38.500000>0.025400 }
cylinder{<13.000000,0.038000,52.500000><13.000000,-1.538000,52.500000>0.025400 }
cylinder{<22.500000,0.038000,53.000000><22.500000,-1.538000,53.000000>0.025400 }
cylinder{<14.500000,0.038000,61.000000><14.500000,-1.538000,61.000000>0.025400 }
cylinder{<38.000000,0.038000,48.500000><38.000000,-1.538000,48.500000>0.025400 }
cylinder{<21.000000,0.038000,50.000000><21.000000,-1.538000,50.000000>0.025400 }
cylinder{<21.000000,0.038000,56.500000><21.000000,-1.538000,56.500000>0.025400 }
cylinder{<41.000000,0.038000,53.000000><41.000000,-1.538000,53.000000>0.025400 }
cylinder{<17.500000,0.038000,69.500000><17.500000,-1.538000,69.500000>0.025400 }
cylinder{<35.000000,0.038000,58.500000><35.000000,-1.538000,58.500000>0.025400 }
cylinder{<18.000000,0.038000,63.500000><18.000000,-1.538000,63.500000>0.025400 }
cylinder{<48.500000,0.038000,66.500000><48.500000,-1.538000,66.500000>0.025400 }
cylinder{<21.000000,0.038000,73.500000><21.000000,-1.538000,73.500000>0.025400 }
cylinder{<53.000000,0.038000,71.500000><53.000000,-1.538000,71.500000>0.025400 }
cylinder{<54.500000,0.038000,76.000000><54.500000,-1.538000,76.000000>0.025400 }
cylinder{<22.000000,0.038000,74.000000><22.000000,-1.538000,74.000000>0.025400 }
cylinder{<20.500000,0.038000,67.500000><20.500000,-1.538000,67.500000>0.025400 }
cylinder{<51.000000,0.038000,73.000000><51.000000,-1.538000,73.000000>0.025400 }
cylinder{<22.500000,0.038000,65.000000><22.500000,-1.538000,65.000000>0.025400 }
cylinder{<47.000000,0.038000,59.500000><47.000000,-1.538000,59.500000>0.025400 }
cylinder{<22.500000,0.038000,61.000000><22.500000,-1.538000,61.000000>0.025400 }
cylinder{<52.000000,0.038000,59.000000><52.000000,-1.538000,59.000000>0.025400 }
cylinder{<24.500000,0.038000,71.000000><24.500000,-1.538000,71.000000>0.025400 }
cylinder{<55.000000,0.038000,67.000000><55.000000,-1.538000,67.000000>0.025400 }
cylinder{<24.500000,0.038000,63.500000><24.500000,-1.538000,63.500000>0.025400 }
cylinder{<51.000000,0.038000,65.000000><51.000000,-1.538000,65.000000>0.025400 }
cylinder{<25.000000,0.038000,41.500000><25.000000,-1.538000,41.500000>0.025400 }
cylinder{<121.500000,0.038000,38.500000><121.500000,-1.538000,38.500000>0.025400 }
cylinder{<28.000000,0.038000,39.000000><28.000000,-1.538000,39.000000>0.025400 }
cylinder{<122.500000,0.038000,41.000000><122.500000,-1.538000,41.000000>0.025400 }
cylinder{<34.000000,0.038000,41.500000><34.000000,-1.538000,41.500000>0.025400 }
cylinder{<121.500000,0.038000,41.500000><121.500000,-1.538000,41.500000>0.025400 }
cylinder{<31.000000,0.038000,41.500000><31.000000,-1.538000,41.500000>0.025400 }
cylinder{<127.500000,0.038000,48.500000><127.500000,-1.538000,48.500000>0.025400 }
cylinder{<45.000000,0.038000,50.500000><45.000000,-1.538000,50.500000>0.025400 }
cylinder{<127.500000,0.038000,50.000000><127.500000,-1.538000,50.000000>0.025400 }
cylinder{<40.500000,0.038000,56.000000><40.500000,-1.538000,56.000000>0.025400 }
cylinder{<126.500000,0.038000,52.500000><126.500000,-1.538000,52.500000>0.025400 }
cylinder{<47.500000,0.038000,54.500000><47.500000,-1.538000,54.500000>0.025400 }
cylinder{<127.500000,0.038000,53.000000><127.500000,-1.538000,53.000000>0.025400 }
cylinder{<55.500000,0.038000,70.000000><55.500000,-1.538000,70.000000>0.025400 }
cylinder{<72.500000,0.038000,72.000000><72.500000,-1.538000,72.000000>0.025400 }
cylinder{<60.000000,0.038000,71.500000><60.000000,-1.538000,71.500000>0.025400 }
cylinder{<72.500000,0.038000,71.500000><72.500000,-1.538000,71.500000>0.025400 }
cylinder{<54.000000,0.038000,65.000000><54.000000,-1.538000,65.000000>0.025400 }
cylinder{<73.500000,0.038000,65.000000><73.500000,-1.538000,65.000000>0.025400 }
cylinder{<57.500000,0.038000,64.000000><57.500000,-1.538000,64.000000>0.025400 }
cylinder{<73.000000,0.038000,65.000000><73.000000,-1.538000,65.000000>0.025400 }
cylinder{<55.500000,0.038000,59.000000><55.500000,-1.538000,59.000000>0.025400 }
cylinder{<70.000000,0.038000,63.500000><70.000000,-1.538000,63.500000>0.025400 }
cylinder{<35.500000,0.038000,35.500000><35.500000,-1.538000,35.500000>0.025400 }
cylinder{<72.500000,0.038000,37.500000><72.500000,-1.538000,37.500000>0.025400 }
cylinder{<11.000000,0.038000,63.500000><11.000000,-1.538000,63.500000>0.025400 }
cylinder{<92.500000,0.038000,54.000000><92.500000,-1.538000,54.000000>0.025400 }
cylinder{<94.500000,0.038000,53.000000><94.500000,-1.538000,53.000000>0.025400 }
cylinder{<96.500000,0.038000,51.500000><96.500000,-1.538000,51.500000>0.025400 }
cylinder{<97.000000,0.038000,51.500000><97.000000,-1.538000,51.500000>0.025400 }
cylinder{<106.000000,0.038000,63.500000><106.000000,-1.538000,63.500000>0.025400 }
cylinder{<105.000000,0.038000,64.500000><105.000000,-1.538000,64.500000>0.025400 }
cylinder{<104.500000,0.038000,67.000000><104.500000,-1.538000,67.000000>0.025400 }
cylinder{<104.500000,0.038000,68.500000><104.500000,-1.538000,68.500000>0.025400 }
cylinder{<104.500000,0.038000,69.500000><104.500000,-1.538000,69.500000>0.025400 }
cylinder{<104.500000,0.038000,71.000000><104.500000,-1.538000,71.000000>0.025400 }
cylinder{<91.000000,0.038000,64.500000><91.000000,-1.538000,64.500000>0.025400 }
cylinder{<94.000000,0.038000,65.500000><94.000000,-1.538000,65.500000>0.025400 }
cylinder{<96.000000,0.038000,67.000000><96.000000,-1.538000,67.000000>0.025400 }
cylinder{<97.500000,0.038000,68.000000><97.500000,-1.538000,68.000000>0.025400 }
cylinder{<98.000000,0.038000,67.500000><98.000000,-1.538000,67.500000>0.025400 }
cylinder{<108.500000,0.038000,55.000000><108.500000,-1.538000,55.000000>0.025400 }
cylinder{<108.000000,0.038000,52.500000><108.000000,-1.538000,52.500000>0.025400 }
cylinder{<108.000000,0.038000,51.000000><108.000000,-1.538000,51.000000>0.025400 }
cylinder{<108.000000,0.038000,49.500000><108.000000,-1.538000,49.500000>0.025400 }
cylinder{<108.000000,0.038000,48.500000><108.000000,-1.538000,48.500000>0.025400 }
cylinder{<108.000000,0.038000,47.000000><108.000000,-1.538000,47.000000>0.025400 }
cylinder{<68.000000,0.038000,32.000000><68.000000,-1.538000,32.000000>0.025400 }
cylinder{<70.500000,0.038000,34.500000><70.500000,-1.538000,34.500000>0.025400 }
cylinder{<56.500000,0.038000,34.500000><56.500000,-1.538000,34.500000>0.025400 }
cylinder{<99.500000,0.038000,32.000000><99.500000,-1.538000,32.000000>0.025400 }
cylinder{<36.000000,0.038000,34.500000><36.000000,-1.538000,34.500000>0.025400 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
//IC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.220000,0.000000,13.763000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.220000,0.000000,29.892000>}
box{<0,0,-0.076200><16.129000,0.036000,0.076200> rotate<0,90.000000,0> translate<31.220000,0.000000,29.892000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.220000,0.000000,29.892000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.600000,0.000000,29.892000>}
box{<0,0,-0.076200><7.620000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.600000,0.000000,29.892000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.600000,0.000000,29.892000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.600000,0.000000,13.763000>}
box{<0,0,-0.076200><16.129000,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.600000,0.000000,13.763000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.220000,0.000000,13.763000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.600000,0.000000,13.763000>}
box{<0,0,-0.076200><7.620000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.600000,0.000000,13.763000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<30.940600,0.000000,14.017000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<30.940600,0.000000,29.638000>}
box{<0,0,-0.025400><15.621000,0.036000,0.025400> rotate<0,90.000000,0> translate<30.940600,0.000000,29.638000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<23.879400,0.000000,29.638000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<30.940600,0.000000,29.638000>}
box{<0,0,-0.025400><7.061200,0.036000,0.025400> rotate<0,0.000000,0> translate<23.879400,0.000000,29.638000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<23.879400,0.000000,29.638000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<23.879400,0.000000,14.017000>}
box{<0,0,-0.025400><15.621000,0.036000,0.025400> rotate<0,-90.000000,0> translate<23.879400,0.000000,14.017000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<30.940600,0.000000,14.017000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<23.879400,0.000000,14.017000>}
box{<0,0,-0.025400><7.061200,0.036000,0.025400> rotate<0,0.000000,0> translate<23.879400,0.000000,14.017000> }
difference{
cylinder{<29.772200,0,15.160000><29.772200,0.036000,15.160000>0.889000 translate<0,0.000000,0>}
cylinder{<29.772200,-0.1,15.160000><29.772200,0.135000,15.160000>0.736600 translate<0,0.000000,0>}}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<32.121700,0.000000,21.510000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<31.359700,0.000000,21.510000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<31.359700,0.000000,22.145000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<31.359700,0.000000,22.780000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<31.359700,0.000000,23.415000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<31.359700,0.000000,24.050000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<31.359700,0.000000,24.685000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<31.359700,0.000000,25.320000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<31.359700,0.000000,25.955000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<31.359700,0.000000,26.590000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<31.359700,0.000000,27.225000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<31.359700,0.000000,27.860000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<31.359700,0.000000,28.495000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<31.359700,0.000000,20.875000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<31.359700,0.000000,20.240000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<31.359700,0.000000,19.605000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<31.359700,0.000000,18.970000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<31.359700,0.000000,18.335000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<31.359700,0.000000,17.700000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<31.359700,0.000000,17.065000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<31.359700,0.000000,16.430000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<31.359700,0.000000,15.795000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<31.359700,0.000000,15.160000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<32.121700,0.000000,15.160000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<32.121700,0.000000,15.795000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<32.121700,0.000000,16.430000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<32.121700,0.000000,17.065000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<32.121700,0.000000,17.700000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<32.121700,0.000000,18.335000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<32.121700,0.000000,18.970000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<32.121700,0.000000,19.605000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<32.121700,0.000000,20.240000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<32.121700,0.000000,20.875000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<31.359700,0.000000,14.525000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<32.121700,0.000000,14.525000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<32.121700,0.000000,22.145000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<32.121700,0.000000,22.780000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<32.121700,0.000000,23.415000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<32.121700,0.000000,24.050000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<32.121700,0.000000,24.685000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<32.121700,0.000000,25.320000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<32.121700,0.000000,25.955000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<32.121700,0.000000,26.590000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<32.121700,0.000000,27.225000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<32.121700,0.000000,27.860000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<32.121700,0.000000,28.495000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<23.460300,0.000000,21.510000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<23.460300,0.000000,14.525000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<23.460300,0.000000,15.160000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<23.460300,0.000000,15.795000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<23.460300,0.000000,16.430000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<23.460300,0.000000,17.065000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<23.460300,0.000000,17.700000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<23.460300,0.000000,18.335000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<23.460300,0.000000,18.970000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<23.460300,0.000000,19.605000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<23.460300,0.000000,20.240000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<23.460300,0.000000,20.875000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<23.460300,0.000000,22.145000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<23.460300,0.000000,22.780000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<23.460300,0.000000,23.415000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<23.460300,0.000000,24.050000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<23.460300,0.000000,24.685000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<23.460300,0.000000,25.320000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<23.460300,0.000000,25.955000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<23.460300,0.000000,26.590000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<23.460300,0.000000,27.225000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<23.460300,0.000000,27.860000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<23.460300,0.000000,28.495000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<23.460300,0.000000,29.130000>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-90.000000,0> translate<31.359700,0.000000,29.130000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<32.121700,0.000000,29.130000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<22.698300,0.000000,21.510000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<22.698300,0.000000,14.525000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<22.698300,0.000000,15.160000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<22.698300,0.000000,15.795000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<22.698300,0.000000,16.430000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<22.698300,0.000000,17.065000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<22.698300,0.000000,17.700000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<22.698300,0.000000,18.335000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<22.698300,0.000000,18.970000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<22.698300,0.000000,19.605000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<22.698300,0.000000,20.240000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<22.698300,0.000000,20.875000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<22.698300,0.000000,22.145000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<22.698300,0.000000,22.780000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<22.698300,0.000000,23.415000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<22.698300,0.000000,24.050000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<22.698300,0.000000,24.685000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<22.698300,0.000000,25.320000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<22.698300,0.000000,25.955000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<22.698300,0.000000,26.590000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<22.698300,0.000000,27.225000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<22.698300,0.000000,27.860000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<22.698300,0.000000,28.495000>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-90.000000,0> translate<22.698300,0.000000,29.130000>}
//IC2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.884200,0.000000,48.544000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.884200,0.000000,40.416000>}
box{<0,0,-0.076200><8.128000,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.884200,0.000000,40.416000> }
object{ARC(0.381000,0.152400,0.000000,90.000000,0.036000) translate<57.414800,0.000000,48.544000>}
object{ARC(0.381000,0.152400,180.000000,270.000000,0.036000) translate<54.265200,0.000000,40.416000>}
object{ARC(0.381000,0.152400,90.000000,180.000000,0.036000) translate<54.265200,0.000000,48.544000>}
object{ARC(0.381000,0.152400,270.000000,360.000000,0.036000) translate<57.414800,0.000000,40.416000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.795800,0.000000,40.416000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.795800,0.000000,48.544000>}
box{<0,0,-0.076200><8.128000,0.036000,0.076200> rotate<0,90.000000,0> translate<57.795800,0.000000,48.544000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.414800,0.000000,48.925000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.265200,0.000000,48.925000>}
box{<0,0,-0.076200><3.149600,0.036000,0.076200> rotate<0,0.000000,0> translate<54.265200,0.000000,48.925000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.265200,0.000000,40.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.332000,0.000000,40.035000>}
box{<0,0,-0.076200><1.066800,0.036000,0.076200> rotate<0,0.000000,0> translate<54.265200,0.000000,40.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.332000,0.000000,40.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.348000,0.000000,40.035000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.332000,0.000000,40.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.348000,0.000000,40.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.414800,0.000000,40.035000>}
box{<0,0,-0.076200><1.066800,0.036000,0.076200> rotate<0,0.000000,0> translate<56.348000,0.000000,40.035000> }
object{ARC(0.508000,0.152400,0.000000,180.000000,0.036000) translate<55.840000,0.000000,40.035000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<57.440200,0.000000,40.035000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<57.440200,0.000000,48.925000>}
box{<0,0,-0.025400><8.890000,0.036000,0.025400> rotate<0,90.000000,0> translate<57.440200,0.000000,48.925000> }
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<53.312700,0.000000,44.480000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<58.367300,0.000000,40.670000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<58.367300,0.000000,41.940000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<58.341900,0.000000,43.210000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<58.367300,0.000000,44.480000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<53.312700,0.000000,43.210000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<53.312700,0.000000,41.940000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<53.312700,0.000000,40.670000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<53.312700,0.000000,45.750000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<53.312700,0.000000,47.020000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<53.312700,0.000000,48.290000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<58.367300,0.000000,45.750000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<58.367300,0.000000,47.020000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<58.367300,0.000000,48.290000>}
//IC4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.114000,0.000000,21.115800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.986000,0.000000,21.115800>}
box{<0,0,-0.076200><8.128000,0.036000,0.076200> rotate<0,0.000000,0> translate<66.986000,0.000000,21.115800> }
object{ARC(0.381000,0.152400,270.000000,360.000000,0.036000) translate<75.114000,0.000000,17.585200>}
object{ARC(0.381000,0.152400,90.000000,180.000000,0.036000) translate<66.986000,0.000000,20.734800>}
object{ARC(0.381000,0.152400,0.000000,90.000000,0.036000) translate<75.114000,0.000000,20.734800>}
object{ARC(0.381000,0.152400,180.000000,270.000000,0.036000) translate<66.986000,0.000000,17.585200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.986000,0.000000,17.204200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.114000,0.000000,17.204200>}
box{<0,0,-0.076200><8.128000,0.036000,0.076200> rotate<0,0.000000,0> translate<66.986000,0.000000,17.204200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.495000,0.000000,17.585200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.495000,0.000000,20.734800>}
box{<0,0,-0.076200><3.149600,0.036000,0.076200> rotate<0,90.000000,0> translate<75.495000,0.000000,20.734800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.605000,0.000000,20.734800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.605000,0.000000,19.668000>}
box{<0,0,-0.076200><1.066800,0.036000,0.076200> rotate<0,-90.000000,0> translate<66.605000,0.000000,19.668000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.605000,0.000000,19.668000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.605000,0.000000,18.652000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,-90.000000,0> translate<66.605000,0.000000,18.652000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.605000,0.000000,18.652000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.605000,0.000000,17.585200>}
box{<0,0,-0.076200><1.066800,0.036000,0.076200> rotate<0,-90.000000,0> translate<66.605000,0.000000,17.585200> }
object{ARC(0.508000,0.152400,270.000000,450.000000,0.036000) translate<66.605000,0.000000,19.160000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<66.605000,0.000000,17.559800>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.495000,0.000000,17.559800>}
box{<0,0,-0.025400><8.890000,0.036000,0.025400> rotate<0,0.000000,0> translate<66.605000,0.000000,17.559800> }
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<71.050000,0.000000,21.687300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<67.240000,0.000000,16.632700>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<68.510000,0.000000,16.632700>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<69.780000,0.000000,16.658100>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<71.050000,0.000000,16.632700>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<69.780000,0.000000,21.687300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<68.510000,0.000000,21.687300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<67.240000,0.000000,21.687300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<72.320000,0.000000,21.687300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<73.590000,0.000000,21.687300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<74.860000,0.000000,21.687300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<72.320000,0.000000,16.632700>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<73.590000,0.000000,16.632700>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<74.860000,0.000000,16.632700>}
//IC5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<107.684000,0.000000,29.115800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.556000,0.000000,29.115800>}
box{<0,0,-0.076200><8.128000,0.036000,0.076200> rotate<0,0.000000,0> translate<99.556000,0.000000,29.115800> }
object{ARC(0.381000,0.152400,270.000000,360.000000,0.036000) translate<107.684000,0.000000,25.585200>}
object{ARC(0.381000,0.152400,90.000000,180.000000,0.036000) translate<99.556000,0.000000,28.734800>}
object{ARC(0.381000,0.152400,0.000000,90.000000,0.036000) translate<107.684000,0.000000,28.734800>}
object{ARC(0.381000,0.152400,180.000000,270.000000,0.036000) translate<99.556000,0.000000,25.585200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.556000,0.000000,25.204200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<107.684000,0.000000,25.204200>}
box{<0,0,-0.076200><8.128000,0.036000,0.076200> rotate<0,0.000000,0> translate<99.556000,0.000000,25.204200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<108.065000,0.000000,25.585200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<108.065000,0.000000,28.734800>}
box{<0,0,-0.076200><3.149600,0.036000,0.076200> rotate<0,90.000000,0> translate<108.065000,0.000000,28.734800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.175000,0.000000,28.734800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.175000,0.000000,27.668000>}
box{<0,0,-0.076200><1.066800,0.036000,0.076200> rotate<0,-90.000000,0> translate<99.175000,0.000000,27.668000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.175000,0.000000,27.668000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.175000,0.000000,26.652000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,-90.000000,0> translate<99.175000,0.000000,26.652000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.175000,0.000000,26.652000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.175000,0.000000,25.585200>}
box{<0,0,-0.076200><1.066800,0.036000,0.076200> rotate<0,-90.000000,0> translate<99.175000,0.000000,25.585200> }
object{ARC(0.508000,0.152400,270.000000,450.000000,0.036000) translate<99.175000,0.000000,27.160000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<99.175000,0.000000,25.559800>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<108.065000,0.000000,25.559800>}
box{<0,0,-0.025400><8.890000,0.036000,0.025400> rotate<0,0.000000,0> translate<99.175000,0.000000,25.559800> }
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<103.620000,0.000000,29.687300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<99.810000,0.000000,24.632700>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<101.080000,0.000000,24.632700>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<102.350000,0.000000,24.658100>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<103.620000,0.000000,24.632700>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<102.350000,0.000000,29.687300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<101.080000,0.000000,29.687300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<99.810000,0.000000,29.687300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<104.890000,0.000000,29.687300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<106.160000,0.000000,29.687300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<107.430000,0.000000,29.687300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<104.890000,0.000000,24.632700>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<106.160000,0.000000,24.632700>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<107.430000,0.000000,24.632700>}
//IC6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.814000,0.000000,37.815800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.686000,0.000000,37.815800>}
box{<0,0,-0.076200><8.128000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.686000,0.000000,37.815800> }
object{ARC(0.381000,0.152400,270.000000,360.000000,0.036000) translate<78.814000,0.000000,34.285200>}
object{ARC(0.381000,0.152400,90.000000,180.000000,0.036000) translate<70.686000,0.000000,37.434800>}
object{ARC(0.381000,0.152400,0.000000,90.000000,0.036000) translate<78.814000,0.000000,37.434800>}
object{ARC(0.381000,0.152400,180.000000,270.000000,0.036000) translate<70.686000,0.000000,34.285200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.686000,0.000000,33.904200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.814000,0.000000,33.904200>}
box{<0,0,-0.076200><8.128000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.686000,0.000000,33.904200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.195000,0.000000,34.285200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.195000,0.000000,37.434800>}
box{<0,0,-0.076200><3.149600,0.036000,0.076200> rotate<0,90.000000,0> translate<79.195000,0.000000,37.434800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.305000,0.000000,37.434800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.305000,0.000000,36.368000>}
box{<0,0,-0.076200><1.066800,0.036000,0.076200> rotate<0,-90.000000,0> translate<70.305000,0.000000,36.368000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.305000,0.000000,36.368000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.305000,0.000000,35.352000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,-90.000000,0> translate<70.305000,0.000000,35.352000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.305000,0.000000,35.352000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.305000,0.000000,34.285200>}
box{<0,0,-0.076200><1.066800,0.036000,0.076200> rotate<0,-90.000000,0> translate<70.305000,0.000000,34.285200> }
object{ARC(0.508000,0.152400,270.000000,450.000000,0.036000) translate<70.305000,0.000000,35.860000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<70.305000,0.000000,34.259800>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<79.195000,0.000000,34.259800>}
box{<0,0,-0.025400><8.890000,0.036000,0.025400> rotate<0,0.000000,0> translate<70.305000,0.000000,34.259800> }
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<74.750000,0.000000,38.387300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<70.940000,0.000000,33.332700>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<72.210000,0.000000,33.332700>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<73.480000,0.000000,33.358100>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<74.750000,0.000000,33.332700>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<73.480000,0.000000,38.387300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<72.210000,0.000000,38.387300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<70.940000,0.000000,38.387300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<76.020000,0.000000,38.387300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<77.290000,0.000000,38.387300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<78.560000,0.000000,38.387300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<76.020000,0.000000,33.332700>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<77.290000,0.000000,33.332700>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<78.560000,0.000000,33.332700>}
//IC8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.653000,0.000000,63.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.782000,0.000000,63.450000>}
box{<0,0,-0.076200><16.129000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.653000,0.000000,63.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.782000,0.000000,63.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.782000,0.000000,71.070000>}
box{<0,0,-0.076200><7.620000,0.036000,0.076200> rotate<0,90.000000,0> translate<25.782000,0.000000,71.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.782000,0.000000,71.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.653000,0.000000,71.070000>}
box{<0,0,-0.076200><16.129000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.653000,0.000000,71.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.653000,0.000000,63.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.653000,0.000000,71.070000>}
box{<0,0,-0.076200><7.620000,0.036000,0.076200> rotate<0,90.000000,0> translate<9.653000,0.000000,71.070000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.907000,0.000000,63.729400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.528000,0.000000,63.729400>}
box{<0,0,-0.025400><15.621000,0.036000,0.025400> rotate<0,0.000000,0> translate<9.907000,0.000000,63.729400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.528000,0.000000,70.790600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.528000,0.000000,63.729400>}
box{<0,0,-0.025400><7.061200,0.036000,0.025400> rotate<0,-90.000000,0> translate<25.528000,0.000000,63.729400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.528000,0.000000,70.790600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.907000,0.000000,70.790600>}
box{<0,0,-0.025400><15.621000,0.036000,0.025400> rotate<0,0.000000,0> translate<9.907000,0.000000,70.790600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.907000,0.000000,63.729400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.907000,0.000000,70.790600>}
box{<0,0,-0.025400><7.061200,0.036000,0.025400> rotate<0,90.000000,0> translate<9.907000,0.000000,70.790600> }
difference{
cylinder{<11.050000,0,64.897800><11.050000,0.036000,64.897800>0.889000 translate<0,0.000000,0>}
cylinder{<11.050000,-0.1,64.897800><11.050000,0.135000,64.897800>0.736600 translate<0,0.000000,0>}}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<17.400000,0.000000,62.548300>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<17.400000,0.000000,63.310300>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<18.035000,0.000000,63.310300>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<18.670000,0.000000,63.310300>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<19.305000,0.000000,63.310300>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<19.940000,0.000000,63.310300>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<20.575000,0.000000,63.310300>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<21.210000,0.000000,63.310300>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<21.845000,0.000000,63.310300>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<22.480000,0.000000,63.310300>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<23.115000,0.000000,63.310300>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<23.750000,0.000000,63.310300>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<24.385000,0.000000,63.310300>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<16.765000,0.000000,63.310300>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<16.130000,0.000000,63.310300>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<15.495000,0.000000,63.310300>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<14.860000,0.000000,63.310300>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<14.225000,0.000000,63.310300>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<13.590000,0.000000,63.310300>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<12.955000,0.000000,63.310300>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<12.320000,0.000000,63.310300>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<11.685000,0.000000,63.310300>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<11.050000,0.000000,63.310300>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<11.050000,0.000000,62.548300>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<11.685000,0.000000,62.548300>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<12.320000,0.000000,62.548300>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<12.955000,0.000000,62.548300>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<13.590000,0.000000,62.548300>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<14.225000,0.000000,62.548300>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<14.860000,0.000000,62.548300>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<15.495000,0.000000,62.548300>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<16.130000,0.000000,62.548300>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<16.765000,0.000000,62.548300>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<10.415000,0.000000,63.310300>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<10.415000,0.000000,62.548300>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<18.035000,0.000000,62.548300>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<18.670000,0.000000,62.548300>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<19.305000,0.000000,62.548300>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<19.940000,0.000000,62.548300>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<20.575000,0.000000,62.548300>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<21.210000,0.000000,62.548300>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<21.845000,0.000000,62.548300>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<22.480000,0.000000,62.548300>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<23.115000,0.000000,62.548300>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<23.750000,0.000000,62.548300>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<24.385000,0.000000,62.548300>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<17.400000,0.000000,71.209700>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<10.415000,0.000000,71.209700>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<11.050000,0.000000,71.209700>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<11.685000,0.000000,71.209700>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<12.320000,0.000000,71.209700>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<12.955000,0.000000,71.209700>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<13.590000,0.000000,71.209700>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<14.225000,0.000000,71.209700>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<14.860000,0.000000,71.209700>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<15.495000,0.000000,71.209700>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<16.130000,0.000000,71.209700>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<16.765000,0.000000,71.209700>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<18.035000,0.000000,71.209700>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<18.670000,0.000000,71.209700>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<19.305000,0.000000,71.209700>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<19.940000,0.000000,71.209700>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<20.575000,0.000000,71.209700>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<21.210000,0.000000,71.209700>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<21.845000,0.000000,71.209700>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<22.480000,0.000000,71.209700>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<23.115000,0.000000,71.209700>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<23.750000,0.000000,71.209700>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<24.385000,0.000000,71.209700>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<25.020000,0.000000,71.209700>}
box{<-0.127000,0,-0.139700><0.127000,0.036000,0.139700> rotate<0,-0.000000,0> translate<25.020000,0.000000,63.310300>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<25.020000,0.000000,62.548300>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<17.400000,0.000000,71.971700>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<10.415000,0.000000,71.971700>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<11.050000,0.000000,71.971700>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<11.685000,0.000000,71.971700>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<12.320000,0.000000,71.971700>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<12.955000,0.000000,71.971700>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<13.590000,0.000000,71.971700>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<14.225000,0.000000,71.971700>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<14.860000,0.000000,71.971700>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<15.495000,0.000000,71.971700>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<16.130000,0.000000,71.971700>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<16.765000,0.000000,71.971700>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<18.035000,0.000000,71.971700>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<18.670000,0.000000,71.971700>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<19.305000,0.000000,71.971700>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<19.940000,0.000000,71.971700>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<20.575000,0.000000,71.971700>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<21.210000,0.000000,71.971700>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<21.845000,0.000000,71.971700>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<22.480000,0.000000,71.971700>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<23.115000,0.000000,71.971700>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<23.750000,0.000000,71.971700>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<24.385000,0.000000,71.971700>}
box{<-0.127000,0,-0.622300><0.127000,0.036000,0.622300> rotate<0,-0.000000,0> translate<25.020000,0.000000,71.971700>}
//IC9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.515800,0.000000,37.186000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.515800,0.000000,45.314000>}
box{<0,0,-0.076200><8.128000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.515800,0.000000,45.314000> }
object{ARC(0.381000,0.152400,180.000000,270.000000,0.036000) translate<24.985200,0.000000,37.186000>}
object{ARC(0.381000,0.152400,0.000000,90.000000,0.036000) translate<28.134800,0.000000,45.314000>}
object{ARC(0.381000,0.152400,270.000000,360.000000,0.036000) translate<28.134800,0.000000,37.186000>}
object{ARC(0.381000,0.152400,90.000000,180.000000,0.036000) translate<24.985200,0.000000,45.314000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.604200,0.000000,45.314000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.604200,0.000000,37.186000>}
box{<0,0,-0.076200><8.128000,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.604200,0.000000,37.186000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.985200,0.000000,36.805000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.134800,0.000000,36.805000>}
box{<0,0,-0.076200><3.149600,0.036000,0.076200> rotate<0,0.000000,0> translate<24.985200,0.000000,36.805000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.134800,0.000000,45.695000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.068000,0.000000,45.695000>}
box{<0,0,-0.076200><1.066800,0.036000,0.076200> rotate<0,0.000000,0> translate<27.068000,0.000000,45.695000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.068000,0.000000,45.695000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.052000,0.000000,45.695000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.052000,0.000000,45.695000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.052000,0.000000,45.695000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.985200,0.000000,45.695000>}
box{<0,0,-0.076200><1.066800,0.036000,0.076200> rotate<0,0.000000,0> translate<24.985200,0.000000,45.695000> }
object{ARC(0.508000,0.152400,180.000000,360.000000,0.036000) translate<26.560000,0.000000,45.695000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.959800,0.000000,45.695000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.959800,0.000000,36.805000>}
box{<0,0,-0.025400><8.890000,0.036000,0.025400> rotate<0,-90.000000,0> translate<24.959800,0.000000,36.805000> }
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-270.000000,0> translate<29.087300,0.000000,41.250000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-270.000000,0> translate<24.032700,0.000000,45.060000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-270.000000,0> translate<24.032700,0.000000,43.790000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-270.000000,0> translate<24.058100,0.000000,42.520000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-270.000000,0> translate<24.032700,0.000000,41.250000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-270.000000,0> translate<29.087300,0.000000,42.520000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-270.000000,0> translate<29.087300,0.000000,43.790000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-270.000000,0> translate<29.087300,0.000000,45.060000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-270.000000,0> translate<29.087300,0.000000,39.980000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-270.000000,0> translate<29.087300,0.000000,38.710000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-270.000000,0> translate<29.087300,0.000000,37.440000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-270.000000,0> translate<24.032700,0.000000,39.980000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-270.000000,0> translate<24.032700,0.000000,38.710000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-270.000000,0> translate<24.032700,0.000000,37.440000>}
//IC11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.484200,0.000000,56.114000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.484200,0.000000,47.986000>}
box{<0,0,-0.076200><8.128000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.484200,0.000000,47.986000> }
object{ARC(0.381000,0.152400,0.000000,90.000000,0.036000) translate<41.014800,0.000000,56.114000>}
object{ARC(0.381000,0.152400,180.000000,270.000000,0.036000) translate<37.865200,0.000000,47.986000>}
object{ARC(0.381000,0.152400,90.000000,180.000000,0.036000) translate<37.865200,0.000000,56.114000>}
object{ARC(0.381000,0.152400,270.000000,360.000000,0.036000) translate<41.014800,0.000000,47.986000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.395800,0.000000,47.986000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.395800,0.000000,56.114000>}
box{<0,0,-0.076200><8.128000,0.036000,0.076200> rotate<0,90.000000,0> translate<41.395800,0.000000,56.114000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.014800,0.000000,56.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.865200,0.000000,56.495000>}
box{<0,0,-0.076200><3.149600,0.036000,0.076200> rotate<0,0.000000,0> translate<37.865200,0.000000,56.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.865200,0.000000,47.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.932000,0.000000,47.605000>}
box{<0,0,-0.076200><1.066800,0.036000,0.076200> rotate<0,0.000000,0> translate<37.865200,0.000000,47.605000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.932000,0.000000,47.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.948000,0.000000,47.605000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.932000,0.000000,47.605000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.948000,0.000000,47.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.014800,0.000000,47.605000>}
box{<0,0,-0.076200><1.066800,0.036000,0.076200> rotate<0,0.000000,0> translate<39.948000,0.000000,47.605000> }
object{ARC(0.508000,0.152400,0.000000,180.000000,0.036000) translate<39.440000,0.000000,47.605000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<41.040200,0.000000,47.605000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<41.040200,0.000000,56.495000>}
box{<0,0,-0.025400><8.890000,0.036000,0.025400> rotate<0,90.000000,0> translate<41.040200,0.000000,56.495000> }
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<36.912700,0.000000,52.050000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<41.967300,0.000000,48.240000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<41.967300,0.000000,49.510000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<41.941900,0.000000,50.780000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<41.967300,0.000000,52.050000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<36.912700,0.000000,50.780000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<36.912700,0.000000,49.510000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<36.912700,0.000000,48.240000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<36.912700,0.000000,53.320000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<36.912700,0.000000,54.590000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<36.912700,0.000000,55.860000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<41.967300,0.000000,53.320000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<41.967300,0.000000,54.590000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<41.967300,0.000000,55.860000>}
//IC12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.104000,0.000000,73.485800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.976000,0.000000,73.485800>}
box{<0,0,-0.076200><8.128000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.976000,0.000000,73.485800> }
object{ARC(0.381000,0.152400,270.000000,360.000000,0.036000) translate<57.104000,0.000000,69.955200>}
object{ARC(0.381000,0.152400,90.000000,180.000000,0.036000) translate<48.976000,0.000000,73.104800>}
object{ARC(0.381000,0.152400,0.000000,90.000000,0.036000) translate<57.104000,0.000000,73.104800>}
object{ARC(0.381000,0.152400,180.000000,270.000000,0.036000) translate<48.976000,0.000000,69.955200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.976000,0.000000,69.574200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.104000,0.000000,69.574200>}
box{<0,0,-0.076200><8.128000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.976000,0.000000,69.574200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.485000,0.000000,69.955200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.485000,0.000000,73.104800>}
box{<0,0,-0.076200><3.149600,0.036000,0.076200> rotate<0,90.000000,0> translate<57.485000,0.000000,73.104800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.595000,0.000000,73.104800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.595000,0.000000,72.038000>}
box{<0,0,-0.076200><1.066800,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.595000,0.000000,72.038000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.595000,0.000000,72.038000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.595000,0.000000,71.022000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.595000,0.000000,71.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.595000,0.000000,71.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.595000,0.000000,69.955200>}
box{<0,0,-0.076200><1.066800,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.595000,0.000000,69.955200> }
object{ARC(0.508000,0.152400,270.000000,450.000000,0.036000) translate<48.595000,0.000000,71.530000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<48.595000,0.000000,69.929800>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<57.485000,0.000000,69.929800>}
box{<0,0,-0.025400><8.890000,0.036000,0.025400> rotate<0,0.000000,0> translate<48.595000,0.000000,69.929800> }
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<53.040000,0.000000,74.057300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<49.230000,0.000000,69.002700>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<50.500000,0.000000,69.002700>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<51.770000,0.000000,69.028100>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<53.040000,0.000000,69.002700>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<51.770000,0.000000,74.057300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<50.500000,0.000000,74.057300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<49.230000,0.000000,74.057300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<54.310000,0.000000,74.057300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<55.580000,0.000000,74.057300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<56.850000,0.000000,74.057300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<54.310000,0.000000,69.002700>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<55.580000,0.000000,69.002700>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<56.850000,0.000000,69.002700>}
//IC13 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.054000,0.000000,62.485800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.926000,0.000000,62.485800>}
box{<0,0,-0.076200><8.128000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.926000,0.000000,62.485800> }
object{ARC(0.381000,0.152400,270.000000,360.000000,0.036000) translate<57.054000,0.000000,58.955200>}
object{ARC(0.381000,0.152400,90.000000,180.000000,0.036000) translate<48.926000,0.000000,62.104800>}
object{ARC(0.381000,0.152400,0.000000,90.000000,0.036000) translate<57.054000,0.000000,62.104800>}
object{ARC(0.381000,0.152400,180.000000,270.000000,0.036000) translate<48.926000,0.000000,58.955200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.926000,0.000000,58.574200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.054000,0.000000,58.574200>}
box{<0,0,-0.076200><8.128000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.926000,0.000000,58.574200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.435000,0.000000,58.955200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.435000,0.000000,62.104800>}
box{<0,0,-0.076200><3.149600,0.036000,0.076200> rotate<0,90.000000,0> translate<57.435000,0.000000,62.104800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.545000,0.000000,62.104800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.545000,0.000000,61.038000>}
box{<0,0,-0.076200><1.066800,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.545000,0.000000,61.038000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.545000,0.000000,61.038000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.545000,0.000000,60.022000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.545000,0.000000,60.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.545000,0.000000,60.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.545000,0.000000,58.955200>}
box{<0,0,-0.076200><1.066800,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.545000,0.000000,58.955200> }
object{ARC(0.508000,0.152400,270.000000,450.000000,0.036000) translate<48.545000,0.000000,60.530000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<48.545000,0.000000,58.929800>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<57.435000,0.000000,58.929800>}
box{<0,0,-0.025400><8.890000,0.036000,0.025400> rotate<0,0.000000,0> translate<48.545000,0.000000,58.929800> }
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<52.990000,0.000000,63.057300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<49.180000,0.000000,58.002700>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<50.450000,0.000000,58.002700>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<51.720000,0.000000,58.028100>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<52.990000,0.000000,58.002700>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<51.720000,0.000000,63.057300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<50.450000,0.000000,63.057300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<49.180000,0.000000,63.057300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<54.260000,0.000000,63.057300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<55.530000,0.000000,63.057300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<56.800000,0.000000,63.057300>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<54.260000,0.000000,58.002700>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<55.530000,0.000000,58.002700>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-0.000000,0> translate<56.800000,0.000000,58.002700>}
//U$1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.170000,0.000000,43.400000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<75.150000,0.000000,43.400000>}
box{<0,0,-0.101600><6.020000,0.036000,0.101600> rotate<0,0.000000,0> translate<75.150000,0.000000,43.400000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<75.150000,0.000000,43.400000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<75.150000,0.000000,57.160000>}
box{<0,0,-0.101600><13.760000,0.036000,0.101600> rotate<0,90.000000,0> translate<75.150000,0.000000,57.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<75.150000,0.000000,57.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.170000,0.000000,57.160000>}
box{<0,0,-0.101600><6.020000,0.036000,0.101600> rotate<0,0.000000,0> translate<75.150000,0.000000,57.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.170000,0.000000,57.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.170000,0.000000,43.400000>}
box{<0,0,-0.101600><13.760000,0.036000,0.101600> rotate<0,-90.000000,0> translate<81.170000,0.000000,43.400000> }
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<74.385050,0.000000,55.360000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<74.385050,0.000000,54.090000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<74.385050,0.000000,52.820000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<74.385050,0.000000,51.550000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<74.385050,0.000000,50.280000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<74.385050,0.000000,49.010000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<74.385050,0.000000,47.740000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<74.385050,0.000000,46.470000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<74.385050,0.000000,45.200000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<81.934950,0.000000,45.200000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<81.934950,0.000000,46.470000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<81.934950,0.000000,47.740000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<81.934950,0.000000,49.010000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<81.934950,0.000000,50.280000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<81.934950,0.000000,51.550000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<81.934950,0.000000,52.820000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<81.934950,0.000000,54.090000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<81.934950,0.000000,55.360000>}
//U$2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<122.830000,0.000000,75.380000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<128.850000,0.000000,75.380000>}
box{<0,0,-0.101600><6.020000,0.036000,0.101600> rotate<0,0.000000,0> translate<122.830000,0.000000,75.380000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<128.850000,0.000000,75.380000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<128.850000,0.000000,61.620000>}
box{<0,0,-0.101600><13.760000,0.036000,0.101600> rotate<0,-90.000000,0> translate<128.850000,0.000000,61.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<128.850000,0.000000,61.620000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<122.830000,0.000000,61.620000>}
box{<0,0,-0.101600><6.020000,0.036000,0.101600> rotate<0,0.000000,0> translate<122.830000,0.000000,61.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<122.830000,0.000000,61.620000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<122.830000,0.000000,75.380000>}
box{<0,0,-0.101600><13.760000,0.036000,0.101600> rotate<0,90.000000,0> translate<122.830000,0.000000,75.380000> }
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<129.614950,0.000000,63.420000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<129.614950,0.000000,64.690000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<129.614950,0.000000,65.960000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<129.614950,0.000000,67.230000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<129.614950,0.000000,68.500000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<129.614950,0.000000,69.770000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<129.614950,0.000000,71.040000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<129.614950,0.000000,72.310000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<129.614950,0.000000,73.580000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<122.065050,0.000000,73.580000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<122.065050,0.000000,72.310000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<122.065050,0.000000,71.040000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<122.065050,0.000000,69.770000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<122.065050,0.000000,68.500000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<122.065050,0.000000,67.230000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<122.065050,0.000000,65.960000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<122.065050,0.000000,64.690000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<122.065050,0.000000,63.420000>}
//U$3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<122.430000,0.000000,57.870000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<128.450000,0.000000,57.870000>}
box{<0,0,-0.101600><6.020000,0.036000,0.101600> rotate<0,0.000000,0> translate<122.430000,0.000000,57.870000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<128.450000,0.000000,57.870000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<128.450000,0.000000,44.110000>}
box{<0,0,-0.101600><13.760000,0.036000,0.101600> rotate<0,-90.000000,0> translate<128.450000,0.000000,44.110000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<128.450000,0.000000,44.110000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<122.430000,0.000000,44.110000>}
box{<0,0,-0.101600><6.020000,0.036000,0.101600> rotate<0,0.000000,0> translate<122.430000,0.000000,44.110000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<122.430000,0.000000,44.110000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<122.430000,0.000000,57.870000>}
box{<0,0,-0.101600><13.760000,0.036000,0.101600> rotate<0,90.000000,0> translate<122.430000,0.000000,57.870000> }
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<129.214950,0.000000,45.910000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<129.214950,0.000000,47.180000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<129.214950,0.000000,48.450000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<129.214950,0.000000,49.720000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<129.214950,0.000000,50.990000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<129.214950,0.000000,52.260000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<129.214950,0.000000,53.530000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<129.214950,0.000000,54.800000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<129.214950,0.000000,56.070000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<121.665050,0.000000,56.070000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<121.665050,0.000000,54.800000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<121.665050,0.000000,53.530000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<121.665050,0.000000,52.260000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<121.665050,0.000000,50.990000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<121.665050,0.000000,49.720000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<121.665050,0.000000,48.450000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<121.665050,0.000000,47.180000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-90.000000,0> translate<121.665050,0.000000,45.910000>}
//U$4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<80.570000,0.000000,61.350000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.550000,0.000000,61.350000>}
box{<0,0,-0.101600><6.020000,0.036000,0.101600> rotate<0,0.000000,0> translate<74.550000,0.000000,61.350000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.550000,0.000000,61.350000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.550000,0.000000,75.110000>}
box{<0,0,-0.101600><13.760000,0.036000,0.101600> rotate<0,90.000000,0> translate<74.550000,0.000000,75.110000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.550000,0.000000,75.110000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<80.570000,0.000000,75.110000>}
box{<0,0,-0.101600><6.020000,0.036000,0.101600> rotate<0,0.000000,0> translate<74.550000,0.000000,75.110000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<80.570000,0.000000,75.110000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<80.570000,0.000000,61.350000>}
box{<0,0,-0.101600><13.760000,0.036000,0.101600> rotate<0,-90.000000,0> translate<80.570000,0.000000,61.350000> }
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<73.785050,0.000000,73.310000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<73.785050,0.000000,72.040000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<73.785050,0.000000,70.770000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<73.785050,0.000000,69.500000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<73.785050,0.000000,68.230000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<73.785050,0.000000,66.960000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<73.785050,0.000000,65.690000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<73.785050,0.000000,64.420000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<73.785050,0.000000,63.150000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<81.334950,0.000000,63.150000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<81.334950,0.000000,64.420000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<81.334950,0.000000,65.690000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<81.334950,0.000000,66.960000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<81.334950,0.000000,68.230000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<81.334950,0.000000,69.500000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<81.334950,0.000000,70.770000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<81.334950,0.000000,72.040000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<81.334950,0.000000,73.310000>}
//X1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<103.040000,0.000000,43.030000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<103.040000,0.000000,74.730000>}
box{<0,0,-0.101600><31.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<103.040000,0.000000,74.730000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<103.040000,0.000000,74.730000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<101.540000,0.000000,74.730000>}
box{<0,0,-0.101600><1.500000,0.036000,0.101600> rotate<0,0.000000,0> translate<101.540000,0.000000,74.730000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<100.740000,0.000000,74.730000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<99.240000,0.000000,74.730000>}
box{<0,0,-0.101600><1.500000,0.036000,0.101600> rotate<0,0.000000,0> translate<99.240000,0.000000,74.730000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<99.240000,0.000000,74.730000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<99.240000,0.000000,43.030000>}
box{<0,0,-0.101600><31.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<99.240000,0.000000,43.030000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<99.240000,0.000000,43.030000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<100.740000,0.000000,43.030000>}
box{<0,0,-0.101600><1.500000,0.036000,0.101600> rotate<0,0.000000,0> translate<99.240000,0.000000,43.030000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<101.540000,0.000000,43.030000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<103.040000,0.000000,43.030000>}
box{<0,0,-0.101600><1.500000,0.036000,0.101600> rotate<0,0.000000,0> translate<101.540000,0.000000,43.030000> }
object{ARC(0.442831,0.203200,25.407500,154.592500,0.036000) translate<101.140000,0.000000,42.840003>}
object{ARC(0.442831,0.203200,205.407500,334.592500,0.036000) translate<101.140000,0.000000,74.919997>}
cylinder{<0,0,0><0,0.036000,0>0.275000 translate<100.140000,0.000000,43.880000>}
cylinder{<0,0,0><0,0.036000,0>0.275000 translate<107.140000,0.000000,43.880000>}
box{<0,0,-0.275000><7.000000,0.036000,0.275000> rotate<0,0.000000,0> translate<100.140000,0.000000,43.880000> }
cylinder{<0,0,0><0,0.036000,0>0.275000 translate<100.140000,0.000000,45.880000>}
cylinder{<0,0,0><0,0.036000,0>0.275000 translate<107.140000,0.000000,45.880000>}
box{<0,0,-0.275000><7.000000,0.036000,0.275000> rotate<0,0.000000,0> translate<100.140000,0.000000,45.880000> }
cylinder{<0,0,0><0,0.036000,0>0.275000 translate<100.140000,0.000000,47.880000>}
cylinder{<0,0,0><0,0.036000,0>0.275000 translate<107.140000,0.000000,47.880000>}
box{<0,0,-0.275000><7.000000,0.036000,0.275000> rotate<0,0.000000,0> translate<100.140000,0.000000,47.880000> }
cylinder{<0,0,0><0,0.036000,0>0.275000 translate<100.140000,0.000000,49.880000>}
cylinder{<0,0,0><0,0.036000,0>0.275000 translate<107.140000,0.000000,49.880000>}
box{<0,0,-0.275000><7.000000,0.036000,0.275000> rotate<0,0.000000,0> translate<100.140000,0.000000,49.880000> }
cylinder{<0,0,0><0,0.036000,0>0.275000 translate<100.140000,0.000000,51.880000>}
cylinder{<0,0,0><0,0.036000,0>0.275000 translate<107.140000,0.000000,51.880000>}
box{<0,0,-0.275000><7.000000,0.036000,0.275000> rotate<0,0.000000,0> translate<100.140000,0.000000,51.880000> }
cylinder{<0,0,0><0,0.036000,0>0.275000 translate<100.140000,0.000000,53.880000>}
cylinder{<0,0,0><0,0.036000,0>0.275000 translate<107.140000,0.000000,53.880000>}
box{<0,0,-0.275000><7.000000,0.036000,0.275000> rotate<0,0.000000,0> translate<100.140000,0.000000,53.880000> }
cylinder{<0,0,0><0,0.036000,0>0.275000 translate<100.140000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.275000 translate<107.140000,0.000000,55.880000>}
box{<0,0,-0.275000><7.000000,0.036000,0.275000> rotate<0,0.000000,0> translate<100.140000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.275000 translate<100.140000,0.000000,57.880000>}
cylinder{<0,0,0><0,0.036000,0>0.275000 translate<107.140000,0.000000,57.880000>}
box{<0,0,-0.275000><7.000000,0.036000,0.275000> rotate<0,0.000000,0> translate<100.140000,0.000000,57.880000> }
cylinder{<0,0,0><0,0.036000,0>0.275000 translate<100.140000,0.000000,59.880000>}
cylinder{<0,0,0><0,0.036000,0>0.275000 translate<107.140000,0.000000,59.880000>}
box{<0,0,-0.275000><7.000000,0.036000,0.275000> rotate<0,0.000000,0> translate<100.140000,0.000000,59.880000> }
cylinder{<0,0,0><0,0.036000,0>0.275000 translate<100.140000,0.000000,61.880000>}
cylinder{<0,0,0><0,0.036000,0>0.275000 translate<107.140000,0.000000,61.880000>}
box{<0,0,-0.275000><7.000000,0.036000,0.275000> rotate<0,0.000000,0> translate<100.140000,0.000000,61.880000> }
cylinder{<0,0,0><0,0.036000,0>0.275000 translate<100.140000,0.000000,63.880000>}
cylinder{<0,0,0><0,0.036000,0>0.275000 translate<107.140000,0.000000,63.880000>}
box{<0,0,-0.275000><7.000000,0.036000,0.275000> rotate<0,0.000000,0> translate<100.140000,0.000000,63.880000> }
cylinder{<0,0,0><0,0.036000,0>0.275000 translate<100.140000,0.000000,65.880000>}
cylinder{<0,0,0><0,0.036000,0>0.275000 translate<107.140000,0.000000,65.880000>}
box{<0,0,-0.275000><7.000000,0.036000,0.275000> rotate<0,0.000000,0> translate<100.140000,0.000000,65.880000> }
cylinder{<0,0,0><0,0.036000,0>0.275000 translate<100.140000,0.000000,67.880000>}
cylinder{<0,0,0><0,0.036000,0>0.275000 translate<107.140000,0.000000,67.880000>}
box{<0,0,-0.275000><7.000000,0.036000,0.275000> rotate<0,0.000000,0> translate<100.140000,0.000000,67.880000> }
cylinder{<0,0,0><0,0.036000,0>0.275000 translate<100.140000,0.000000,69.880000>}
cylinder{<0,0,0><0,0.036000,0>0.275000 translate<107.140000,0.000000,69.880000>}
box{<0,0,-0.275000><7.000000,0.036000,0.275000> rotate<0,0.000000,0> translate<100.140000,0.000000,69.880000> }
cylinder{<0,0,0><0,0.036000,0>0.275000 translate<100.140000,0.000000,71.880000>}
cylinder{<0,0,0><0,0.036000,0>0.275000 translate<107.140000,0.000000,71.880000>}
box{<0,0,-0.275000><7.000000,0.036000,0.275000> rotate<0,0.000000,0> translate<100.140000,0.000000,71.880000> }
cylinder{<0,0,0><0,0.036000,0>0.275000 translate<100.140000,0.000000,73.880000>}
cylinder{<0,0,0><0,0.036000,0>0.275000 translate<107.140000,0.000000,73.880000>}
box{<0,0,-0.275000><7.000000,0.036000,0.275000> rotate<0,0.000000,0> translate<100.140000,0.000000,73.880000> }
box{<-0.250000,0,-0.250000><0.250000,0.036000,0.250000> rotate<0,-90.000000,0> translate<102.140000,0.000000,43.880000>}
box{<-0.250000,0,-0.250000><0.250000,0.036000,0.250000> rotate<0,-90.000000,0> translate<100.140000,0.000000,43.880000>}
box{<-0.250000,0,-0.250000><0.250000,0.036000,0.250000> rotate<0,-90.000000,0> translate<102.140000,0.000000,45.880000>}
box{<-0.250000,0,-0.250000><0.250000,0.036000,0.250000> rotate<0,-90.000000,0> translate<100.140000,0.000000,45.880000>}
box{<-0.250000,0,-0.250000><0.250000,0.036000,0.250000> rotate<0,-90.000000,0> translate<102.140000,0.000000,47.880000>}
box{<-0.250000,0,-0.250000><0.250000,0.036000,0.250000> rotate<0,-90.000000,0> translate<100.140000,0.000000,47.880000>}
box{<-0.250000,0,-0.250000><0.250000,0.036000,0.250000> rotate<0,-90.000000,0> translate<102.140000,0.000000,49.880000>}
box{<-0.250000,0,-0.250000><0.250000,0.036000,0.250000> rotate<0,-90.000000,0> translate<100.140000,0.000000,49.880000>}
box{<-0.250000,0,-0.250000><0.250000,0.036000,0.250000> rotate<0,-90.000000,0> translate<102.140000,0.000000,51.880000>}
box{<-0.250000,0,-0.250000><0.250000,0.036000,0.250000> rotate<0,-90.000000,0> translate<100.140000,0.000000,51.880000>}
box{<-0.250000,0,-0.250000><0.250000,0.036000,0.250000> rotate<0,-90.000000,0> translate<102.140000,0.000000,53.880000>}
box{<-0.250000,0,-0.250000><0.250000,0.036000,0.250000> rotate<0,-90.000000,0> translate<100.140000,0.000000,53.880000>}
box{<-0.250000,0,-0.250000><0.250000,0.036000,0.250000> rotate<0,-90.000000,0> translate<102.140000,0.000000,55.880000>}
box{<-0.250000,0,-0.250000><0.250000,0.036000,0.250000> rotate<0,-90.000000,0> translate<100.140000,0.000000,55.880000>}
box{<-0.250000,0,-0.250000><0.250000,0.036000,0.250000> rotate<0,-90.000000,0> translate<102.140000,0.000000,57.880000>}
box{<-0.250000,0,-0.250000><0.250000,0.036000,0.250000> rotate<0,-90.000000,0> translate<100.140000,0.000000,57.880000>}
box{<-0.250000,0,-0.250000><0.250000,0.036000,0.250000> rotate<0,-90.000000,0> translate<102.140000,0.000000,59.880000>}
box{<-0.250000,0,-0.250000><0.250000,0.036000,0.250000> rotate<0,-90.000000,0> translate<100.140000,0.000000,59.880000>}
box{<-0.250000,0,-0.250000><0.250000,0.036000,0.250000> rotate<0,-90.000000,0> translate<102.140000,0.000000,61.880000>}
box{<-0.250000,0,-0.250000><0.250000,0.036000,0.250000> rotate<0,-90.000000,0> translate<100.140000,0.000000,61.880000>}
box{<-0.250000,0,-0.250000><0.250000,0.036000,0.250000> rotate<0,-90.000000,0> translate<102.140000,0.000000,63.880000>}
box{<-0.250000,0,-0.250000><0.250000,0.036000,0.250000> rotate<0,-90.000000,0> translate<100.140000,0.000000,63.880000>}
box{<-0.250000,0,-0.250000><0.250000,0.036000,0.250000> rotate<0,-90.000000,0> translate<102.140000,0.000000,65.880000>}
box{<-0.250000,0,-0.250000><0.250000,0.036000,0.250000> rotate<0,-90.000000,0> translate<100.140000,0.000000,65.880000>}
box{<-0.250000,0,-0.250000><0.250000,0.036000,0.250000> rotate<0,-90.000000,0> translate<102.140000,0.000000,67.880000>}
box{<-0.250000,0,-0.250000><0.250000,0.036000,0.250000> rotate<0,-90.000000,0> translate<100.140000,0.000000,67.880000>}
box{<-0.250000,0,-0.250000><0.250000,0.036000,0.250000> rotate<0,-90.000000,0> translate<102.140000,0.000000,69.880000>}
box{<-0.250000,0,-0.250000><0.250000,0.036000,0.250000> rotate<0,-90.000000,0> translate<100.140000,0.000000,69.880000>}
box{<-0.250000,0,-0.250000><0.250000,0.036000,0.250000> rotate<0,-90.000000,0> translate<102.140000,0.000000,71.880000>}
box{<-0.250000,0,-0.250000><0.250000,0.036000,0.250000> rotate<0,-90.000000,0> translate<100.140000,0.000000,71.880000>}
box{<-0.250000,0,-0.250000><0.250000,0.036000,0.250000> rotate<0,-90.000000,0> translate<102.140000,0.000000,73.880000>}
box{<-0.250000,0,-0.250000><0.250000,0.036000,0.250000> rotate<0,-90.000000,0> translate<100.140000,0.000000,73.880000>}
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  LED_DRIVER(-80.000000,0,-50.000000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//IC1	74AC16374	SSOP48DL
//IC8	74AC16374	SSOP48DL
//U$1	ULN2804-SM	SOP-18
//U$2	ULN2804-SM	SOP-18
//U$3	ULN2804-SM	SOP-18
//U$4	ULN2804-SM	SOP-18
//X1	332-32	332-32
