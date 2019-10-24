-------------------------------------------------------------------------------
-- Copyright (c) 2001 Mentor Graphics Corporation
--
-- This model is a component of the Mentor Graphics VHDL-AMS educational open 
-- source model library, and is covered by this license agreement. This model,
-- including any updates, modifications, revisions, copies, and documentation 
-- are copyrighted works of Mentor Graphics. USE OF THIS MODEL INDICATES YOUR 
-- COMPLETE AND UNCONDITIONAL ACCEPTANCE OF THE TERMS AND CONDITIONS SET FORTH
-- IN THIS LICENSE AGREEMENT.  Mentor Graphics grants you a non-exclusive 
-- license to use, reproduce, modify and distribute this model, provided that:
-- (a) no fee or other consideration is charged for any distribution except 
-- compilations distributed in accordance with Section (d) of this license 
-- agreement; (b) the comment text embedded in this model is included verbatim
-- in each copy of this model made or distributed by you, whether or not such 
-- version is modified; (c) any modified version must include a conspicuous 
-- notice that this model has been modified and the date of modification; and 
-- (d) any compilations sold by you that include this model must include a 
-- conspicuous notice that this model is available from Mentor Graphics in its
-- original form at no charge.
--
-- THIS MODEL IS LICENSED TO YOU "AS IS" AND WITH NO WARRANTIES, EXPRESS OR 
-- IMPLIED.  MENTOR GRAPHICS SPECIFICALLY DISCLAIMS ALL IMPLIED WARRANTIES OF 
-- MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.  MENTOR GRAPHICS SHALL
-- HAVE NO RESPONSIBILITY FOR ANY DAMAGES WHATSOEVER.
-------------------------------------------------------------------------------
-- File       : gear_rv_r.vhd
-- Author     : Mentor Graphics
-- Created    : 2001/10/10
-- Last update: 2001/10/10
-------------------------------------------------------------------------------
-- Description: Gear Model (ROTATIONAL_V/ROTATIONAL domains)
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version     Author              Description
-- 2001/10/10  1.0         Mentor Graphics     Created    
-------------------------------------------------------------------------------

-- Use proposed IEEE natures and packages
library IEEE_proposed;
use IEEE_proposed.mechanical_systems.all;

entity gear_rv_r is

  generic(
    ratio : real := 1.0);   -- Gear ratio (Revs of shaft2 for 1 rev of shaft1)
                            -- Note: can be negative, if shaft polarity changes

  port ( terminal rotv1 : rotational_v;
  		terminal rot2 : rotational);

end entity gear_rv_r;

-------------------------------------------------------------------------------
-- Ideal Architecture
-------------------------------------------------------------------------------
architecture ideal of gear_rv_r is

  quantity w1 across torq_vel through rotv1 to rotational_v_ref;
--  quantity w2 across torq2 through rotv2 to rotational_v_ref;
  quantity theta across torq_ang through rot2 to rotational_ref;

begin

--  w2  == w1*ratio;
  theta == ratio*w1'integ;
  torq_vel == -1.0*torq_ang*ratio;

end architecture ideal;

-------------------------------------------------------------------------------
-- Copyright (c) 2001 Mentor Graphics Corporation
-------------------------------------------------------------------------------
--

-------------------------------------------------------------------------------
-- Rotational to Electrical Converter
--
-------------------------------------------------------------------------------

-- Use IEEE_proposed instead of disciplines
library IEEE;
use ieee.math_real.all;
library IEEE_proposed;
use IEEE_proposed.mechanical_systems.all;
use IEEE_proposed.electrical_systems.all;

entity rot2v is
  
  generic (
    k : real := 1.0);                -- optional gain

  port (
    terminal input   : rotational;  -- input terminal
    terminal output    : electrical);   -- output terminal
  
end entity rot2v ;

architecture bhv of rot2v is
quantity rot_in across input to rotational_ref;     -- Converter's input branch
quantity v_out across out_i through output to electrical_ref;-- Converter's output branch

  begin  -- bhv
   v_out ==  k*rot_in; 
end bhv;
--

-------------------------------------------------------------------------------
-- Control Horn for Rudder Control (mechanical implementation)
--
--  Transfer Function:
--                            
--  tran =   R*sin(rot) 
--
-- Where pos = output translational position,
-- R = horn radius, 
-- theta = input rotational angle
-------------------------------------------------------------------------------

-- Use IEEE_proposed instead of disciplines
library IEEE;
use ieee.math_real.all;
library IEEE_proposed;
use IEEE_proposed.mechanical_systems.all;

entity horn_r2t is
  
  generic (
    R   : real := 1.0);            		-- horn radius

  port (
    terminal theta    : ROTATIONAL;   	-- input angular position port
    terminal pos   : TRANSLATIONAL);  	-- output translational position port
     
end entity horn_r2t;

architecture bhv of horn_r2t is

  QUANTITY rot across rot_tq through theta TO ROTATIONAL_REF;
  QUANTITY tran across tran_frc through pos TO TRANSLATIONAL_REF;

  begin			-- bhv
   tran == R*sin(rot);		-- Convert angle in to translational out
   tran_frc == -rot_tq/R;	-- Convert torque in to force out 
end bhv;
--

-------------------------------------------------------------------------------
-- Control Horn for Rudder Control (mechanical implementation)
--
--  Transfer Function:
--                            
--  theta =   arcsin(pos/R) 
--
-- Where pos = input translational position,
-- R = horn radius, 
-- theta = output rotational angle
-------------------------------------------------------------------------------

-- Use IEEE_proposed instead of disciplines
library IEEE;
use ieee.math_real.all;
library IEEE_proposed;
use IEEE_proposed.mechanical_systems.all;

entity horn_t2r is
  
  generic (
    R   : real := 1.0);            -- Rudder horn radius

  port (
    terminal pos    : translational;   -- input translational position port
    terminal theta   : rotational);  -- output angular position port
     
end entity horn_t2r ;

architecture bhv of horn_t2r is

  QUANTITY tran across tran_frc through pos TO TRANSLATIONAL_REF;
  QUANTITY rot across rot_tq through theta TO ROTATIONAL_REF;

  begin  -- bhv
   rot == arcsin(tran/R);	-- Convert translational to angle
   rot_tq == -tran_frc*R;	-- Convert force to torque
   
end bhv;
--

-------------------------------------------------------------------------------
-- Copyright (c) 2001 Mentor Graphics Corporation
--
-- This model is a component of the Mentor Graphics VHDL-AMS educational open 
-- source model library, and is covered by this license agreement. This model,
-- including any updates, modifications, revisions, copies, and documentation 
-- are copyrighted works of Mentor Graphics. USE OF THIS MODEL INDICATES YOUR 
-- COMPLETE AND UNCONDITIONAL ACCEPTANCE OF THE TERMS AND CONDITIONS SET FORTH
-- IN THIS LICENSE AGREEMENT.  Mentor Graphics grants you a non-exclusive 
-- license to use, reproduce, modify and distribute this model, provided that:
-- (a) no fee or other consideration is charged for any distribution except 
-- compilations distributed in accordance with Section (d) of this license 
-- agreement; (b) the comment text embedded in this model is included verbatim
-- in each copy of this model made or distributed by you, whether or not such 
-- version is modified; (c) any modified version must include a conspicuous 
-- notice that this model has been modified and the date of modification; and 
-- (d) any compilations sold by you that include this model must include a 
-- conspicuous notice that this model is available from Mentor Graphics in its
-- original form at no charge.
--
-- THIS MODEL IS LICENSED TO YOU "AS IS" AND WITH NO WARRANTIES, EXPRESS OR 
-- IMPLIED.  MENTOR GRAPHICS SPECIFICALLY DISCLAIMS ALL IMPLIED WARRANTIES OF 
-- MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.  MENTOR GRAPHICS SHALL
-- HAVE NO RESPONSIBILITY FOR ANY DAMAGES WHATSOEVER.
-------------------------------------------------------------------------------
-- File       : DC_Motor.vhd
-- Author     : Mentor Graphics
-- Created    : 2001/06/16
-- Last update: 2001/06/16
-------------------------------------------------------------------------------
-- Description: Basic DC Motor
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version     Author              Description
-- 2001/06/16  1.0         Mentor Graphics     Created    
-------------------------------------------------------------------------------

-- Use proposed IEEE natures and packages
library IEEE_proposed;
use IEEE_proposed.mechanical_systems.all;
use IEEE_proposed.electrical_systems.all;

entity DC_Motor is

  generic (
    r_wind : resistance;                -- Motor winding resistance [Ohm]
    kt     : real;                      -- Torque coefficient [N*m/Amp]
    l      : inductance;                -- Winding inductance [Henrys]
    d      : real;                      -- Damping coefficient [N*m/(rad/sec)]
    j      : mmoment_i);                -- Moment of inertia [kg*meter**2]

  port (terminal p1, p2 : electrical;
        terminal shaft_rotv : rotational_v);

end entity DC_Motor;

-------------------------------------------------------------------------------
-- Basic Architecture
-- Motor equations:  V = Kt*W + I*Rwind + L*dI/dt
--                   T = -Kt*I + D*W + J*dW/dt
-------------------------------------------------------------------------------
architecture basic of DC_Motor is

  quantity v across i through p1 to p2;
  quantity w across torq through shaft_rotv to rotational_v_ref;

begin

  torq == -1.0*kt*i + d*w + j*w'dot;
  v  == kt*w + i*r_wind + l*i'dot;

end architecture basic;

-------------------------------------------------------------------------------
-- Copyright (c) 2001 Mentor Graphics Corporation
-------------------------------------------------------------------------------
--

-------------------------------------------------------------------------------
-- Copyright (c) 2001 Mentor Graphics Corporation
--
-- This model is a component of the Mentor Graphics VHDL-AMS educational open 
-- source model library, and is covered by this license agreement. This model,
-- including any updates, modifications, revisions, copies, and documentation 
-- are copyrighted works of Mentor Graphics. USE OF THIS MODEL INDICATES YOUR 
-- COMPLETE AND UNCONDITIONAL ACCEPTANCE OF THE TERMS AND CONDITIONS SET FORTH
-- IN THIS LICENSE AGREEMENT.  Mentor Graphics grants you a non-exclusive 
-- license to use, reproduce, modify and distribute this model, provided that:
-- (a) no fee or other consideration is charged for any distribution except 
-- compilations distributed in accordance with Section (d) of this license 
-- agreement; (b) the comment text embedded in this model is included verbatim
-- in each copy of this model made or distributed by you, whether or not such 
-- version is modified; (c) any modified version must include a conspicuous 
-- notice that this model has been modified and the date of modification; and 
-- (d) any compilations sold by you that include this model must include a 
-- conspicuous notice that this model is available from Mentor Graphics in its
-- original form at no charge.
--
-- THIS MODEL IS LICENSED TO YOU "AS IS" AND WITH NO WARRANTIES, EXPRESS OR 
-- IMPLIED.  MENTOR GRAPHICS SPECIFICALLY DISCLAIMS ALL IMPLIED WARRANTIES OF 
-- MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.  MENTOR GRAPHICS SHALL
-- HAVE NO RESPONSIBILITY FOR ANY DAMAGES WHATSOEVER.
-------------------------------------------------------------------------------
-- File       : stop_r.vhd
-- Author     : Mentor Graphics
-- Created    : 2001/10/10
-- Last update: 2001/10/10
-------------------------------------------------------------------------------
-- Description: Mechanical Hard Stop (ROTATIONAL domain)
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version     Author              Description
-- 2001/06/16  1.0         Mentor Graphics     Created    
-------------------------------------------------------------------------------

-- library IEEE;
-- use IEEE.MATH_REAL.all;

-- Use proposed IEEE natures and packages
library IEEE_proposed;
use IEEE_proposed.MECHANICAL_SYSTEMS.all;


entity stop_r is

  generic (
    k_stop    : real;
--    ang_max   : angle;
--    ang_min   : angle := 0.0;
	ang_max   : real;
    ang_min   : real := 0.0;
    damp_stop : real  := 0.000000001
    );

  port ( terminal ang1, ang2 : rotational);

end entity stop_r;

architecture ideal of stop_r is

  quantity velocity : velocity;
  quantity ang across trq through ang1 to ang2;

begin

  velocity == ang'dot;

  if ang > ang_max use
    trq == k_stop * (ang - ang_max) + (damp_stop * velocity);
  elsif ang > ang_min use
    trq   == 0.0;
  else
    trq   == k_stop * (ang - ang_min) + (damp_stop * velocity);
  end use;

break on ang'above(ang_min), ang'above(ang_max);

end architecture ideal;

-------------------------------------------------------------------------------
-- Copyright (c) 2001 Mentor Graphics Corporation
-------------------------------------------------------------------------------
--

library IEEE;
use IEEE.std_logic_arith.all;
library IEEE_proposed;
use IEEE_proposed.mechanical_systems.all;

entity tran_linkage is
port
(
      terminal p1, p2 : translational
);

begin

end tran_linkage;

architecture a1 of tran_linkage is

  QUANTITY pos_1 across frc_1 through p1 TO translational_ref;
  QUANTITY pos_2 across frc_2 through p2 TO translational_ref;

begin

   pos_2 == pos_1;		-- Pass position 
   frc_2 == -frc_1;	-- Pass force

end;
--

-------------------------------------------------------------------------------
-- Rudder Model (Rotational Spring)
--
--  Transfer Function:
--                            
--  torq =   -k*(theta - theta_0)
--
-- Where theta = input rotational angle,
-- torq = output rotational angle,
-- theta_0 = reference angle
-------------------------------------------------------------------------------

-- Use IEEE_proposed instead of disciplines
library IEEE;
use ieee.math_real.all;
library IEEE_proposed;
use IEEE_proposed.mechanical_systems.all;

entity rudder is
  
  generic (
    k   : real := 1.0;            -- Spring constant
	theta_0 : real := 0.0);

  port (
    terminal rot    : rotational);   -- input rotational angle
     
end entity rudder;

architecture bhv of rudder is

  QUANTITY theta across torq through rot TO ROTATIONAL_REF;

  begin  -- bhv

   torq == k*(theta - theta_0);	-- Convert force to torque
   
end bhv;
--

library IEEE;
library IEEE_proposed;
use IEEE_proposed.electrical_systems.all;
use IEEE_proposed.mechanical_systems.all;

entity sum2_e is
	generic (k1, k2: real := 1.0);  -- Gain multipliers
	port 	(	terminal in1, in2: electrical;
			terminal output: electrical);
end entity sum2_e;

architecture simple of sum2_e is
  QUANTITY vin1 ACROSS in1 TO ELECTRICAL_REF;
  QUANTITY vin2 ACROSS in2 TO ELECTRICAL_REF;
  QUANTITY vout ACROSS iout THROUGH output TO ELECTRICAL_REF;

begin
	vout == k1*vin1 + k2*vin2;
end architecture simple;
--

library IEEE;
use IEEE.MATH_REAL.all;
-- Use proposed IEEE natures and packages
library IEEE_proposed;
use IEEE_proposed.ELECTRICAL_SYSTEMS.all;

entity gain_e is
	generic (
		k: REAL := 1.0);  -- Gain multiplier
	port 	(	terminal input : electrical;
			terminal output: electrical);
end entity gain_e;

architecture simple of gain_e is

  QUANTITY vin ACROSS input TO ELECTRICAL_REF;
  QUANTITY vout ACROSS iout THROUGH output TO ELECTRICAL_REF;

begin
	vout == k*vin;
end architecture simple;
--

-------------------------------------------------------------------------------
-- S-Domain Limiter Model
--
-------------------------------------------------------------------------------

library IEEE_proposed; use IEEE_proposed.electrical_systems.all;
entity limiter_2_e is
	generic (
		limit_high : real := 4.8;	-- upper limit
		limit_low : real := -4.8); 	-- lower limit
	port (
		terminal input: electrical;
		terminal output: electrical);					
end entity limiter_2_e;

architecture simple of limiter_2_e is
  	QUANTITY vin ACROSS input TO ELECTRICAL_REF;
  	QUANTITY vout ACROSS iout THROUGH output TO ELECTRICAL_REF;
	constant slope : real := 1.0e-4;
begin
	if vin > limit_high use	-- Upper limit exceeded, so limit input signal
		vout == limit_high + slope*(vin - limit_high);
	elsif vin < limit_low use	-- Lower limit exceeded, so limit input signal
		vout == limit_low + slope*(vin - limit_low);
	else		-- No limit exceeded, so pass input signal as is
		vout == vin;
	end use;
	break on vin'above(limit_high), vin'above(limit_low);
end architecture simple;

--

-------------------------------------------------------------------------------
-- Copyright (c) 2001 Mentor Graphics Corporation
--
-- This model is a component of the Mentor Graphics VHDL-AMS educational open 
-- source model library, and is covered by this license agreement. This model,
-- including any updates, modifications, revisions, copies, and documentation 
-- are copyrighted works of Mentor Graphics. USE OF THIS MODEL INDICATES YOUR 
-- COMPLETE AND UNCONDITIONAL ACCEPTANCE OF THE TERMS AND CONDITIONS SET FORTH
-- IN THIS LICENSE AGREEMENT.  Mentor Graphics grants you a non-exclusive 
-- license to use, reproduce, modify and distribute this model, provided that:
-- (a) no fee or other consideration is charged for any distribution except 
-- compilations distributed in accordance with Section (d) of this license 
-- agreement; (b) the comment text embedded in this model is included verbatim
-- in each copy of this model made or distributed by you, whether or not such 
-- version is modified; (c) any modified version must include a conspicuous 
-- notice that this model has been modified and the date of modification; and 
-- (d) any compilations sold by you that include this model must include a 
-- conspicuous notice that this model is available from Mentor Graphics in its
-- original form at no charge.
--
-- THIS MODEL IS LICENSED TO YOU "AS IS" AND WITH NO WARRANTIES, EXPRESS OR 
-- IMPLIED.  MENTOR GRAPHICS SPECIFICALLY DISCLAIMS ALL IMPLIED WARRANTIES OF 
-- MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.  MENTOR GRAPHICS SHALL
-- HAVE NO RESPONSIBILITY FOR ANY DAMAGES WHATSOEVER.
-------------------------------------------------------------------------------
-- File       : clock.vhd
-- Author     : Mentor Graphics
-- Created    : 2001/06/16
-- Last update: 2001/06/16
-------------------------------------------------------------------------------
-- Description: Digital clock with 50% duty cycle
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version     Author              Description
-- 2001/06/16  1.0         Mentor Graphics     Created    
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity clock is
  generic (
    period : time);                     -- Clock period

  port (
    clk_out : out std_logic);

end entity clock;

architecture ideal of clock is

begin
  CreateClock: process 
  begin
    clk_out <= '0';
    wait for period/2;
    clk_out <= '1';
    wait for period/2;   
  end process CreateClock;

end architecture ideal;


-------------------------------------------------------------------------------
-- Copyright (c) 2001 Mentor Graphics Corporation
-------------------------------------------------------------------------------
--

-------------------------------------------------------------------------------
-- Z-domain Lead Lag Filter
--
--  Z-Domain Transfer Function:
--
--  Y(z)         a0(z) - a1(z-1)         
--  ---- =   k * ---------------
--  X(z)         b0(z) - b1(z-1) 
--
-- Normalizing Gain = k
--
-- Difference Equation:
--
--	Y(K) = AX(k) - BX(k-1) + CY(k-1)
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
library IEEE_proposed;
use IEEE_proposed.electrical_systems.all;

entity lead_lag_diff is
  
  port (
	signal clk : in std_logic; -- clock
	terminal input: electrical;
	terminal output: electrical);
end entity lead_lag_diff;

architecture bhv of lead_lag_diff is
  QUANTITY vin ACROSS input TO ELECTRICAL_REF;
  QUANTITY vout ACROSS iout THROUGH output TO ELECTRICAL_REF;
  CONSTANT k : real := 400.0; -- Normalize gain

signal z_out : real := 0.0;
begin
proc : process (clk)

	variable zi_dly1 : real := 0.0; -- Input delayed 1 clk cycle
	variable zo_dly1 : real := 0.0; -- Output delayed 1 clk cycle
	variable z_new : real := 0.0;	-- New output value this clk cycle

 	begin  -- proc
		zo_dly1 := z_out; -- Store previous output value
		z_new := 0.6163507*vin - 0.6144184*zi_dly1 + 0.2307692*zo_dly1;
		zi_dly1 := vin; -- Store previous input value
		z_out <= z_new;
	end process;
	vout == k*z_out'ramp(100.0e-9); -- Ensure continuous transitions on output
end bhv;
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

library IEEE_proposed;
use IEEE_proposed.electrical_systems.all;
use IEEE_proposed.mechanical_systems.all;

entity rudder_servo_z is
    port(
        terminal servo_in : electrical;
        terminal pos_fb : electrical;
        terminal servo_out : electrical
    );
end rudder_servo_z;

architecture rudder_servo_z of rudder_servo_z is
    -- Component declarations
    -- Signal declarations
    signal clk : std_logic;
    terminal error : electrical;
    terminal limit_in : electrical;
    terminal ll_in : electrical;
    terminal summer_fb : electrical;
begin
    -- Signal assignments
    -- Component instances
    summer : entity work.sum2_e(simple)
        port map(
            in1 => servo_in,
            in2 => summer_fb,
            output => error
        );
    forward_gain : entity work.gain_e(simple)
        generic map(
            k => 100.0
        )
        port map(
            input => error,
            output => ll_in
        );
    fb_gain : entity work.gain_e(simple)
        generic map(
            k => -4.57
        )
        port map(
            input => pos_fb,
            output => summer_fb
        );
    XCMP21 : entity work.limiter_2_e(simple)
         generic map(
            limit_high => 4.8,
            limit_low => -4.8
        )
        port map(
            input => limit_in,
            output => servo_out
        );
    clock1 : entity work.clock(ideal)
        generic map(
            period => 200us
        )
        port map(
            CLK_OUT => clk
        );
    XCMP23 : entity work.lead_lag_diff(bhv)
        port map(
            input => ll_in,
            output => limit_in,
            clk => clk
        );
end rudder_servo_z;
--

-------------------------------------------------------------------------------
-- Copyright (c) 2001 Mentor Graphics Corporation
--
-- This model is a component of the Mentor Graphics VHDL-AMS educational open 
-- source model library, and is covered by this license agreement. This model,
-- including any updates, modifications, revisions, copies, and documentation 
-- are copyrighted works of Mentor Graphics. USE OF THIS MODEL INDICATES YOUR 
-- COMPLETE AND UNCONDITIONAL ACCEPTANCE OF THE TERMS AND CONDITIONS SET FORTH
-- IN THIS LICENSE AGREEMENT.  Mentor Graphics grants you a non-exclusive 
-- license to use, reproduce, modify and distribute this model, provided that:
-- (a) no fee or other consideration is charged for any distribution except 
-- compilations distributed in accordance with Section (d) of this license 
-- agreement; (b) the comment text embedded in this model is included verbatim
-- in each copy of this model made or distributed by you, whether or not such 
-- version is modified; (c) any modified version must include a conspicuous 
-- notice that this model has been modified and the date of modification; and 
-- (d) any compilations sold by you that include this model must include a 
-- conspicuous notice that this model is available from Mentor Graphics in its
-- original form at no charge.
--
-- THIS MODEL IS LICENSED TO YOU "AS IS" AND WITH NO WARRANTIES, EXPRESS OR 
-- IMPLIED.  MENTOR GRAPHICS SPECIFICALLY DISCLAIMS ALL IMPLIED WARRANTIES OF 
-- MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.  MENTOR GRAPHICS SHALL
-- HAVE NO RESPONSIBILITY FOR ANY DAMAGES WHATSOEVER.
-------------------------------------------------------------------------------
-- File       : v_sine.vhd
-- Author     : Mentor Graphics
-- Created    : 2001/06/16
-- Last update: 2001/07/03
-------------------------------------------------------------------------------
-- Description: Electrical sinusoidal voltage source
--              Includes frequency domain settings
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version     Author              Description
-- 2001/06/16  1.0         Mentor Graphics     Created
-- 2001/07/03  1.1         Mentor Graphics     Changed generics from real to
--                                             voltage.
-------------------------------------------------------------------------------

library IEEE;
use IEEE.MATH_REAL.all;
-- Use proposed IEEE natures and packages
library IEEE_proposed;
use IEEE_proposed.ELECTRICAL_SYSTEMS.all;

entity v_sine is

  generic (
    freq      : real;                   -- frequency [Hertz]
    amplitude : voltage;                -- amplitude [Volts]
    phase     : real    := 0.0;         -- initial phase [Degrees]
    offset    : voltage := 0.0;         -- DC value [Volts]
    df        : real    := 0.0;         -- damping factor [1/second]
    ac_mag    : voltage := 1.0;         -- AC magnitude [Volts]
    ac_phase  : real    := 0.0);        -- AC phase [Degrees]

  port (
    terminal pos, neg : electrical);

end entity v_sine;

-------------------------------------------------------------------------------
-- Ideal Architecture
-------------------------------------------------------------------------------
architecture ideal of v_sine is
-- Declare Branch Quantities
  quantity v across i through pos to neg;
-- Declare Quantity for Phase in radians (calculated below)
  quantity phase_rad : real;
-- Declare Quantity in frequency domain for AC analysis
  quantity ac_spec   : real spectrum ac_mag, math_2_pi*ac_phase/360.0;

begin
-- Convert phase to radians
  phase_rad == math_2_pi *(freq * NOW + phase / 360.0);

  if domain = quiescent_domain or domain = time_domain use
    v == offset + amplitude * sin(phase_rad) * EXP(-NOW * df);
  else
    v == ac_spec;           -- used for Frequency (AC) analysis
  end use;

end architecture ideal;

-------------------------------------------------------------------------------
-- Copyright (c) 2001 Mentor Graphics Corporation
-------------------------------------------------------------------------------
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

library IEEE_proposed;
use IEEE_proposed.electrical_systems.all;
use IEEE_proposed.mechanical_systems.all;

entity TB_CS2_Z_Domain_Diff is
end TB_CS2_Z_Domain_Diff;

architecture TB_CS2_Z_Domain_Diff of TB_CS2_Z_Domain_Diff is
    -- Component declarations
    -- Signal declarations
    terminal ctl_horn_in : rotational;
    terminal fb_rot2v : electrical;
    terminal gear_in : rotational_v;
    terminal link_in : translational;
    terminal link_out : translational;
    terminal mot_in : electrical;
    terminal rudder : rotational;
    terminal src_in : electrical;
begin
    -- Signal assignments
    -- Component instances
    gear1 : entity work.gear_rv_r(ideal)
        generic map(
            ratio => 0.01
        )
        port map(
            rotv1 => gear_in,
            rot2 => ctl_horn_in
        );
    gain_fb : entity work.rot2v(bhv)
        generic map(
            k => 1.0
        )
        port map(
            output => fb_rot2v,
            input => ctl_horn_in
        );
    gear_horn : entity work.horn_r2t(bhv)
        port map(
            theta => ctl_horn_in,
            pos => link_in
        );
    rudder_horn : entity work.horn_t2r(bhv)
        port map(
            theta => rudder,
            pos => link_out
        );
    motor1 : entity work.DC_Motor(basic)
        generic map(
            r_wind => 2.2,
            kt => 3.43e-3,
            l => 2.03e-3,
            d => 5.63e-6,
            j => 168.0e-9
        )
        port map(
            p1 => mot_in,
            p2 => ELECTRICAL_REF,
            shaft_rotv => gear_in
        );
    stop1 : entity work.stop_r(ideal)
        generic map(
            damp_stop => 1.0e2,
            k_stop => 1.0e6,
            ang_max => 1.05,
            ang_min => -1.05
        )
        port map(
            ang1 => ctl_horn_in,
            ang2 => ROTATIONAL_REF
        );
    \Linkage\ : entity work.tran_linkage(a1)
        port map(
            p2 => link_out,
            p1 => link_in
        );
    XCMP5 : entity work.rudder(bhv)
        generic map(
            k => 0.2
        )
        port map(
            rot => rudder
        );
    rudder_servo_z1 : entity work.rudder_servo_z
        port map(
            servo_out => mot_in,
            servo_in => src_in,
            pos_fb => fb_rot2v
        );
    v3 : entity work.v_sine(ideal)
        generic map(
            freq => 1.0,
            amplitude => 4.8
        )
        port map(
            pos => src_in,
            neg => ELECTRICAL_REF
        );
end TB_CS2_Z_Domain_Diff;
--

