-- ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
-- Copyright (c) 2012 by Terasic Technologies Inc.
-- ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
--
-- Permission:
--
--   Terasic grants permission to use and modify this code for use
--   in synthesis for all Terasic Development Boards and Altera Development
--   Kits made by Terasic.  Other use of this code, including the selling
--   ,duplication, or modification of any portion is strictly prohibited.
--
-- Disclaimer:
--
--   This VHDL/Verilog or C/C++ source code is intended as a design reference
--   which illustrates how these types of functions can be implemented.
--   It is the user's responsibility to verify their design for
--   consistency and functionality through the use of formal
--   verification methods.  Terasic provides no warranty regarding the use
--   or functionality of this code.
--
-- ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
--
--  Terasic Technologies Inc
--  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
--
--
--
--                     web: http://www.terasic.com/
--                     email: support@terasic.com
--
-- ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
--
-- Major Functions:	DE2_115_Default
--
-- ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
--
-- Revision History :
-- ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
--   Ver  :| Author              :| Mod. Date :| Changes Made:
--   V1.1 :| HdHuang             :| 05/12/10  :| Initial Revision
--   V2.0 :| Eko       				:| 05/23/12  :| version 11.1
-- ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity de2_115_golden_sopc_vhd is
    port (
        ------------ CLOCK ----------
        CLOCK_50   : in STD_LOGIC;
        CLOCK2_50  : in STD_LOGIC;
        CLOCK3_50  : in STD_LOGIC;
        ENETCLK_25 : in STD_LOGIC;
        ------------ Sma ----------
        SMA_CLKIN  : in STD_LOGIC;
        SMA_CLKOUT : out STD_LOGIC;
        ------------ LED ----------
        LEDG : out STD_LOGIC_VECTOR(8 downto 0);
        LEDR : out STD_LOGIC_VECTOR(17 downto 0);
        ------------ KEY ----------
        KEY : in STD_LOGIC_VECTOR(3 downto 0);
        ------------ SW ----------
        SW : in STD_LOGIC_VECTOR(17 downto 0);
        ------------ SEG7 ----------
        HEX0 : out STD_LOGIC_VECTOR(6 downto 0);
        HEX1 : out STD_LOGIC_VECTOR(6 downto 0);
        HEX2 : out STD_LOGIC_VECTOR(6 downto 0);
        HEX3 : out STD_LOGIC_VECTOR(6 downto 0);
        HEX4 : out STD_LOGIC_VECTOR(6 downto 0);
        HEX5 : out STD_LOGIC_VECTOR(6 downto 0);
        HEX6 : out STD_LOGIC_VECTOR(6 downto 0);
        HEX7 : out STD_LOGIC_VECTOR(6 downto 0);
        ------------ LCD ----------
        LCD_BLON : out STD_LOGIC;
        LCD_DATA : inout STD_LOGIC_VECTOR(7 downto 0);
        LCD_EN   : out STD_LOGIC;
        LCD_ON   : out STD_LOGIC;
        LCD_RS   : out STD_LOGIC;
        LCD_RW   : out STD_LOGIC;
        ------------ RS232 ----------
        UART_CTS : in STD_LOGIC;
        UART_RTS : out STD_LOGIC;
        UART_RXD : in STD_LOGIC;
        UART_TXD : out STD_LOGIC;
        ------------ PS2 ----------
        PS2_CLK  : inout STD_LOGIC;
        PS2_DAT  : inout STD_LOGIC;
        PS2_CLK2 : inout STD_LOGIC;
        PS2_DAT2 : inout STD_LOGIC;
        ------------ SDCARD ----------
        SD_CLK  : out STD_LOGIC;
        SD_CMD  : inout STD_LOGIC;
        SD_DAT  : inout STD_LOGIC_VECTOR(3 downto 0);
        SD_WP_N : in STD_LOGIC;
        ------------ VGA ----------
        VGA_B       : out STD_LOGIC_VECTOR(7 downto 0);
        VGA_BLANK_N : out STD_LOGIC;
        VGA_CLK     : out STD_LOGIC;
        VGA_G       : out STD_LOGIC_VECTOR(7 downto 0);
        VGA_HS      : out STD_LOGIC;
        VGA_R       : out STD_LOGIC_VECTOR(7 downto 0);
        VGA_SYNC_N  : out STD_LOGIC;
        VGA_VS      : out STD_LOGIC;
        ------------ Audio ----------
        AUD_ADCDAT  : in STD_LOGIC;
        AUD_ADCLRCK : inout STD_LOGIC;
        AUD_BCLK    : inout STD_LOGIC;
        AUD_DACDAT  : out STD_LOGIC;
        AUD_DACLRCK : inout STD_LOGIC;
        AUD_XCK     : out STD_LOGIC;
        ------------ I2C for EEPROM ----------
        EEP_I2C_SCLK : out STD_LOGIC;
        EEP_I2C_SDAT : inout STD_LOGIC;
        ------------ I2C for Audio and Tv - Decode ----------
        I2C_SCLK : out STD_LOGIC;
        I2C_SDAT : inout STD_LOGIC;
        ------------ Ethernet 0 ----------
        ENET0_GTX_CLK : out STD_LOGIC;
        ENET0_INT_N   : in STD_LOGIC;
        ENET0_MDC     : out STD_LOGIC;
        ENET0_MDIO    : inout STD_LOGIC;
        ENET0_RST_N   : out STD_LOGIC;
        ENET0_RX_CLK  : in STD_LOGIC;
        ENET0_RX_COL  : in STD_LOGIC;
        ENET0_RX_CRS  : in STD_LOGIC;
        ENET0_RX_DATA : in STD_LOGIC_VECTOR(3 downto 0);
        ENET0_RX_DV   : in STD_LOGIC;
        ENET0_RX_ER   : in STD_LOGIC;
        ENET0_TX_CLK  : in STD_LOGIC;
        ENET0_TX_DATA : out STD_LOGIC_VECTOR(3 downto 0);
        ENET0_TX_EN   : out STD_LOGIC;
        ENET0_TX_ER   : out STD_LOGIC;
        ENET0_LINK100 : in STD_LOGIC;
        ------------ Ethernet 1 ----------
        ENET1_GTX_CLK : out STD_LOGIC;
        ENET1_INT_N   : in STD_LOGIC;
        ENET1_MDC     : out STD_LOGIC;
        ENET1_MDIO    : inout STD_LOGIC;
        ENET1_RST_N   : out STD_LOGIC;
        ENET1_RX_CLK  : in STD_LOGIC;
        ENET1_RX_COL  : in STD_LOGIC;
        ENET1_RX_CRS  : in STD_LOGIC;
        ENET1_RX_DATA : in STD_LOGIC_VECTOR(3 downto 0);
        ENET1_RX_DV   : in STD_LOGIC;
        ENET1_RX_ER   : in STD_LOGIC;
        ENET1_TX_CLK  : in STD_LOGIC;
        ENET1_TX_DATA : out STD_LOGIC_VECTOR(3 downto 0);
        ENET1_TX_EN   : out STD_LOGIC;
        ENET1_TX_ER   : out STD_LOGIC;
        ENET1_LINK100 : in STD_LOGIC;
        ------------ TV Decoder 1 ----------
        TD_CLK27   : in STD_LOGIC;
        TD_DATA    : in STD_LOGIC_VECTOR(7 downto 0);
        TD_HS      : in STD_LOGIC;
        TD_RESET_N : out STD_LOGIC;
        TD_VS      : in STD_LOGIC;
        ------------ USB OTG controller ----------
        OTG_DATA  : inout STD_LOGIC_VECTOR(15 downto 0);
        OTG_ADDR  : out STD_LOGIC_VECTOR(1 downto 0);
        OTG_CS_N  : out STD_LOGIC;
        OTG_WR_N  : out STD_LOGIC;
        OTG_RD_N  : out STD_LOGIC;
        OTG_INT   : in STD_LOGIC;
        OTG_RST_N : out STD_LOGIC;
        ------------ IR Receiver ----------
        IRDA_RXD : in STD_LOGIC;
        ------------ SDRAM ----------
        DRAM_ADDR  : out STD_LOGIC_VECTOR(12 downto 0);
        DRAM_BA    : out STD_LOGIC_VECTOR(1 downto 0);
        DRAM_CAS_N : out STD_LOGIC;
        DRAM_CKE   : out STD_LOGIC;
        DRAM_CLK   : out STD_LOGIC;
        DRAM_CS_N  : out STD_LOGIC;
        DRAM_DQ    : inout STD_LOGIC_VECTOR(31 downto 0);
        DRAM_DQM   : out STD_LOGIC_VECTOR(3 downto 0);
        DRAM_RAS_N : out STD_LOGIC;
        DRAM_WE_N  : out STD_LOGIC;
        ------------ SRAM ----------
        SRAM_ADDR : out STD_LOGIC_VECTOR(19 downto 0);
        SRAM_CE_N : out STD_LOGIC;
        SRAM_DQ   : inout STD_LOGIC_VECTOR(15 downto 0);
        SRAM_LB_N : out STD_LOGIC;
        SRAM_OE_N : out STD_LOGIC;
        SRAM_UB_N : out STD_LOGIC;
        SRAM_WE_N : out STD_LOGIC;
        ------------ Flash ----------
        FL_ADDR  : out STD_LOGIC_VECTOR(22 downto 0);
        FL_CE_N  : out STD_LOGIC;
        FL_DQ    : inout STD_LOGIC_VECTOR(7 downto 0);
        FL_OE_N  : out STD_LOGIC;
        FL_RST_N : out STD_LOGIC;
        FL_RY    : in STD_LOGIC;
        FL_WE_N  : out STD_LOGIC;
        FL_WP_N  : out STD_LOGIC;
        ------------ GPIO ----------
        GPIO : inout STD_LOGIC_VECTOR(35 downto 0);
        ------------ HSMC (LVDS) ----------
        HSMC_CLKIN_P1  : in STD_LOGIC;
        HSMC_CLKIN_P2  : in STD_LOGIC;
        HSMC_CLKIN_N1  : in STD_LOGIC;
        HSMC_CLKIN_N2  : in STD_LOGIC;
        HSMC_CLKIN0    : in STD_LOGIC;
        HSMC_CLKOUT_P1 : out STD_LOGIC;
        HSMC_CLKOUT_P2 : out STD_LOGIC;
        HSMC_CLKOUT_N1 : out STD_LOGIC;
        HSMC_CLKOUT_N2 : out STD_LOGIC;
        HSMC_CLKOUT0   : out STD_LOGIC;
        HSMC_D         : inout STD_LOGIC_VECTOR(3 downto 0);
        HSMC_RX_D_P    : in STD_LOGIC_VECTOR(16 downto 0);
        HSMC_TX_D_P    : out STD_LOGIC_VECTOR(16 downto 0);
        HSMC_RX_D_N    : in STD_LOGIC_VECTOR(16 downto 0);
        HSMC_TX_D_N    : out STD_LOGIC_VECTOR(16 downto 0);
        -------- EXTEND IO ----------
        EX_IO : inout STD_LOGIC_VECTOR(6 downto 0);
		-------- EPCS ----------
		epcs_dclk                  : out std_logic;                                        	 -- dclk
		epcs_sce                   : out std_logic;                                        	 -- sce
		epcs_sdo                   : out std_logic;                                        	 -- sdo
		epcs_data0                 : in std_logic := 'X'             						 -- data0
    );
end entity;
architecture rtl of de2_115_golden_sopc_vhd is
    --= == == == == == == == == == == == == == == == == == == == == == == == == == == ==
    -- component declarations
    --= == == == == == == == == == == == == == == == == == == == == == == == == == == == 
    component Qsys_vhd is
        port (
            clk_clk_clk                : in STD_LOGIC := 'X';                                    -- clk
            flash_tcm_address_out      : out STD_LOGIC_VECTOR(22 downto 0);                      -- tcm_address_out
            flash_tcm_read_n_out       : out STD_LOGIC_VECTOR(0 downto 0);                       -- tcm_read_n_out
            flash_tcm_write_n_out      : out STD_LOGIC_VECTOR(0 downto 0);                       -- tcm_write_n_out
            flash_tcm_data_out         : inout STD_LOGIC_VECTOR(7 downto 0) := (others => 'X');  -- tcm_data_out
            flash_tcm_chipselect_n_out : out STD_LOGIC_VECTOR(0 downto 0);                       -- tcm_chipselect_n_out
            led_export                 : out STD_LOGIC_VECTOR(17 downto 0);                      -- export
            rst_rst_reset_n            : in STD_LOGIC := 'X';                                    -- reset_n
            sdram_addr                 : out STD_LOGIC_VECTOR(12 downto 0);                      -- addr
            sdram_ba                   : out STD_LOGIC_VECTOR(1 downto 0);                       -- ba
            sdram_cas_n                : out STD_LOGIC;                                          -- cas_n
            sdram_cke                  : out STD_LOGIC;                                          -- cke
            sdram_cs_n                 : out STD_LOGIC;                                          -- cs_n
            sdram_dq                   : inout STD_LOGIC_VECTOR(31 downto 0) := (others => 'X'); -- dq
            sdram_dqm                  : out STD_LOGIC_VECTOR(3 downto 0);                       -- dqm
            sdram_ras_n                : out STD_LOGIC;                                          -- ras_n
            sdram_we_n                 : out STD_LOGIC;                                          -- we_n
            sdram_clk_clk              : out STD_LOGIC;                                          -- clk
            sram_DQ                    : inout STD_LOGIC_VECTOR(15 downto 0) := (others => 'X'); -- DQ
            sram_ADDR                  : out STD_LOGIC_VECTOR(19 downto 0);                      -- ADDR
            sram_UB_n                  : out STD_LOGIC;                                          -- UB_n
            sram_LB_n                  : out STD_LOGIC;                                          -- LB_n
            sram_WE_n                  : out STD_LOGIC;                                          -- WE_n
            sram_CE_n                  : out STD_LOGIC;                                          -- CE_n
            sram_OE_n                  : out STD_LOGIC;                                          -- OE_n
            uart_rxd                   : in STD_LOGIC := 'X';                                    -- rxd
            uart_txd                   : out STD_LOGIC;                                          -- txd
            uart_cts_n                 : in STD_LOGIC := 'X';                                    -- cts_n
            uart_rts_n                 : out STD_LOGIC;											 -- rts_n			
			epcs_dclk                  : out std_logic;                                        	 -- dclk
			epcs_sce                   : out std_logic;                                        	 -- sce
			epcs_sdo                   : out std_logic;                                        	 -- sdo
			epcs_data0                 : in std_logic := 'X'             						 -- data0
        );
    end component Qsys_vhd;
    --= == == == == == == == == == == == == == == == == == == == == == == == == == == ==
    -- PARAMETER declarations
    --= == == == == == == == == == == == == == == == == == == == == == == == == == == ==

    --= == == == == == == == == == == == == == == == == == == == == == == == == == == ==
    -- signal declarations
    --= == == == == == == == == == == == == == == == == == == == == == == == == == == ==
begin

    -- Flash     
    FL_RST_N <= '1';
    FL_WP_N  <= '1';
    Qsys_vhd_inst : Qsys_vhd
    port map(
        clk_clk_clk                   => CLOCK_50,
        rst_rst_reset_n               => KEY(0),
        flash_tcm_address_out         => FL_ADDR,
        flash_tcm_read_n_out(0)       => FL_OE_N,
        flash_tcm_write_n_out(0)      => FL_WE_N,
        flash_tcm_data_out            => FL_DQ,
        flash_tcm_chipselect_n_out(0) => FL_CE_N,
        led_export                    => LEDR,
        sdram_clk_clk                 => DRAM_CLK,
        sdram_addr                    => DRAM_ADDR,
        sdram_ba                      => DRAM_BA,
        sdram_cas_n                   => DRAM_CAS_N,
        sdram_cke                     => DRAM_CKE,
        sdram_cs_n                    => DRAM_CS_N,
        sdram_dq                      => DRAM_DQ,
        sdram_dqm                     => DRAM_DQM,
        sdram_ras_n                   => DRAM_RAS_N,
        sdram_we_n                    => DRAM_WE_N,
        sram_DQ                       => SRAM_DQ,
        sram_ADDR                     => SRAM_ADDR,
        sram_LB_N                     => SRAM_LB_N,
        sram_UB_N                     => SRAM_UB_N,
        sram_CE_N                     => SRAM_CE_N,
        sram_OE_N                     => SRAM_OE_N,
        sram_WE_N                     => SRAM_WE_N,
        uart_rxd                      => UART_RXD,
        uart_txd                      => UART_TXD,
        uart_cts_n                    => UART_CTS,
        uart_rts_n                    => UART_RTS,
		epcs_dclk          =>       epcs_dclk,
		epcs_sce           =>       epcs_sce,
		epcs_sdo           =>       epcs_sdo,
		epcs_data0         =>       epcs_data0
    );
    --LED 
    LEDG <= (others => '0');
    -- Sma
    SMA_CLKOUT <= '0';
    --HEX
    HEX0 <= (others => '1');
    HEX1 <= (others => '1');
    HEX2 <= (others => '1');
    HEX3 <= (others => '1');
    HEX4 <= (others => '1');
    HEX5 <= (others => '1');
    HEX6 <= (others => '1');
    HEX7 <= (others => '1');
    --LCD
    LCD_BLON <= '0';
    LCD_DATA <= (others => 'Z');
    LCD_EN   <= '0';
    LCD_ON   <= '1';
    LCD_RS   <= '0';
    LCD_RW   <= '0';
    -- ps2
    PS2_CLK  <= 'Z';
    PS2_CLK2 <= 'Z';
    PS2_DAT  <= 'Z';
    PS2_DAT2 <= 'Z';
    -- SDCARD
    SD_CLK <= '0';
    SD_CMD <= 'Z';
    SD_DAT <= (others => 'Z');
    -- VGA
    VGA_CLK     <= '0';
    VGA_BLANK_N <= '1';
    VGA_SYNC_N  <= '1';
    VGA_R       <= (others => '0');
    VGA_G       <= (others => '0');
    VGA_B       <= (others => '0');
    VGA_HS      <= '0';
    VGA_VS      <= '0';
    -- Audio
    AUD_ADCLRCK <= 'Z';
    AUD_BCLK    <= 'Z';
    AUD_DACLRCK <= 'Z';
    AUD_DACDAT  <= '0';
    AUD_XCK     <= '0';
    -- I2C for EEPROM
    EEP_I2C_SCLK <= '0';
    EEP_I2C_SDAT <= 'Z';
    -- I2C for Audio and Tv - Decode
    I2C_SCLK <= '0';
    I2C_SDAT <= 'Z';
    --Ethernet 0
    ENET0_GTX_CLK <= ENET0_INT_N;
    ENET0_MDC     <= ENET0_RX_COL;
    ENET0_RST_N   <= ENET0_RX_CRS;
    ENET0_TX_DATA <= ENET0_RX_DATA;
    ENET0_TX_EN   <= ENET0_RX_ER;
    ENET0_TX_ER   <= ENET0_TX_CLK;
    ENET0_MDIO    <= 'Z';
    --Ethernet 1
    ENET1_GTX_CLK <= ENET1_INT_N;
    ENET1_MDC     <= ENET1_RX_COL;
    ENET1_RST_N   <= ENET1_RX_CRS;
    ENET1_TX_DATA <= ENET1_RX_DATA;
    ENET1_TX_EN   <= ENET1_RX_ER;
    ENET1_TX_ER   <= ENET1_TX_CLK;
    ENET1_MDIO    <= 'Z';
    -- TV
    TD_RESET_N <= TD_VS;
    -- USB OTG controller
    OTG_DATA  <= (others => 'Z');
    OTG_ADDR  <= (others => 'Z');
    OTG_CS_N  <= '1';
    OTG_WR_N  <= '1';
    OTG_RD_N  <= '1';
    OTG_RST_N <= '1';
    -- GPIO
    GPIO <= (others => 'Z');
    -- HSMC
    HSMC_D         <= (others => 'Z');
    HSMC_TX_D_P    <= HSMC_RX_D_P;
    HSMC_CLKOUT_P1 <= HSMC_CLKIN_P1;
    HSMC_CLKOUT_P2 <= HSMC_CLKIN_P2;
    HSMC_CLKOUT0   <= HSMC_CLKIN0;
    -- EXTEND IO
    EX_IO <= (others => 'Z');
end architecture;