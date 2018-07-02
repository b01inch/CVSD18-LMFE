`timescale 1 ns/1 ps
`celldefine
`define End_CYCLE 10000000
`define SDFFILE "./LMFE_syn.sdf"
`ifdef SDF
initial $sdf_annotate(`SDFFILE, LMFE);
`endif

module LMFE ( clk, reset, Din, in_en, busy, out_valid, Dout);
input   clk;
input   reset;
input   in_en;
output  busy;
output  out_valid;
input   [7:0]  Din;
output  [7:0]  Dout;

wire cen_w;
wire wen_w;
wire [7:0] d_w;
wire [7:0] q_w;
wire [9:0] addr_w;

wire [7:0] med_d_w;
wire med_en_w;
wire med_del_w;

wire newline_w;


control MainCT( .clk(clk), .rst(reset), .data_in(Din), .in_en(in_en), .busy(busy), .med_data(med_d_w), .med_en(med_en_w), .med_del(med_del_w), .cen(cen_w), .wen(wen_w), .addr(addr_w), .memd(d_w), .memq(q_w), .out_valid(out_valid), .newline(newline_w));

sram_1024x8_t13 mem( .Q(q_w),.CLK(~clk),.CEN(cen_w),.WEN(wen_w),.A(addr_w),.D(d_w));

insert_sort med(.clk(clk), .rst(reset) , .data_valid(med_en_w) , .data_in(med_d_w), .data_out(Dout), .del_valid(med_del_w), .newline(newline_w)); 

endmodule

module insert_sort(clk,rst,data_valid,data_in,data_out,del_valid,newline); 
input clk,rst,data_valid,del_valid,newline;
input [7:0]data_in;
output [7:0] data_out;

reg [7:0] in_r;

reg [6:0] counter_r;
wire [6:0] counter_w;

reg [1:0] state_r,state_w;

reg [7:0] list_r [48:0];
reg [7:0] list_w [48:0];
wire [48:0] pos_w;

integer i,k; 

parameter S_idle=3'd0;
parameter S_load=3'd1;
parameter S_done=3'd2;
parameter S_dele=3'd3;

assign pos_w[0]=(in_r>list_r[0]);
assign pos_w[1]=(in_r>list_r[1]);
assign pos_w[2]=(in_r>list_r[2]);
assign pos_w[3]=(in_r>list_r[3]);
assign pos_w[4]=(in_r>list_r[4]);
assign pos_w[5]=(in_r>list_r[5]);
assign pos_w[6]=(in_r>list_r[6]);
assign pos_w[7]=(in_r>list_r[7]);
assign pos_w[8]=(in_r>list_r[8]);
assign pos_w[9]=(in_r>list_r[9]);
assign pos_w[10]=(in_r>list_r[10]);
assign pos_w[11]=(in_r>list_r[11]);
assign pos_w[12]=(in_r>list_r[12]);
assign pos_w[13]=(in_r>list_r[13]);
assign pos_w[14]=(in_r>list_r[14]);
assign pos_w[15]=(in_r>list_r[15]);
assign pos_w[16]=(in_r>list_r[16]);
assign pos_w[17]=(in_r>list_r[17]);
assign pos_w[18]=(in_r>list_r[18]);
assign pos_w[19]=(in_r>list_r[19]);
assign pos_w[20]=(in_r>list_r[20]);
assign pos_w[21]=(in_r>list_r[21]);
assign pos_w[22]=(in_r>list_r[22]);
assign pos_w[23]=(in_r>list_r[23]);
assign pos_w[24]=(in_r>list_r[24]);
assign pos_w[25]=(in_r>list_r[25]);
assign pos_w[26]=(in_r>list_r[26]);
assign pos_w[27]=(in_r>list_r[27]);
assign pos_w[28]=(in_r>list_r[28]);
assign pos_w[29]=(in_r>list_r[29]);
assign pos_w[30]=(in_r>list_r[30]);
assign pos_w[31]=(in_r>list_r[31]);
assign pos_w[32]=(in_r>list_r[32]);
assign pos_w[33]=(in_r>list_r[33]);
assign pos_w[34]=(in_r>list_r[34]);
assign pos_w[35]=(in_r>list_r[35]);
assign pos_w[36]=(in_r>list_r[36]);
assign pos_w[37]=(in_r>list_r[37]);
assign pos_w[38]=(in_r>list_r[38]);
assign pos_w[39]=(in_r>list_r[39]);
assign pos_w[40]=(in_r>list_r[40]);
assign pos_w[41]=(in_r>list_r[41]);
assign pos_w[42]=(in_r>list_r[42]);
assign pos_w[43]=(in_r>list_r[43]);
assign pos_w[44]=(in_r>list_r[44]);
assign pos_w[45]=(in_r>list_r[45]);
assign pos_w[46]=(in_r>list_r[46]);
assign pos_w[47]=(in_r>list_r[47]);
assign pos_w[48]=(in_r>list_r[48]);

assign counter_w=(state_r==S_load)?counter_r+7'b1:7'b0;
assign data_out=list_r[24];
			
always@(*)
begin
	case(state_r)
		S_idle:  
		begin
			list_w[0]=list_r[0];
			list_w[1]=list_r[1];
			list_w[2]=list_r[2];
			list_w[3]=list_r[3];
			list_w[4]=list_r[4];
			list_w[5]=list_r[5];
			list_w[6]=list_r[6];
			list_w[7]=list_r[7];
			list_w[8]=list_r[8];
			list_w[9]=list_r[9];
			list_w[10]=list_r[10];
			list_w[11]=list_r[11];
			list_w[12]=list_r[12];
			list_w[13]=list_r[13];
			list_w[14]=list_r[14];
			list_w[15]=list_r[15];
			list_w[16]=list_r[16];
			list_w[17]=list_r[17];
			list_w[18]=list_r[18];
			list_w[19]=list_r[19];
			list_w[20]=list_r[20];
			list_w[21]=list_r[21];
			list_w[22]=list_r[22];
			list_w[23]=list_r[23];
			list_w[24]=list_r[24];
			list_w[25]=list_r[25];
			list_w[26]=list_r[26];
			list_w[27]=list_r[27];
			list_w[28]=list_r[28];
			list_w[29]=list_r[29];
			list_w[30]=list_r[30];
			list_w[31]=list_r[31];
			list_w[32]=list_r[32];
			list_w[33]=list_r[33];
			list_w[34]=list_r[34];
			list_w[35]=list_r[35];
			list_w[36]=list_r[36];
			list_w[37]=list_r[37];
			list_w[38]=list_r[38];
			list_w[39]=list_r[39];
			list_w[40]=list_r[40];
			list_w[41]=list_r[41];
			list_w[42]=list_r[42];
			list_w[43]=list_r[43];	
			list_w[44]=list_r[44];
			list_w[45]=list_r[45];
			list_w[46]=list_r[46];
			list_w[47]=list_r[47];
			list_w[48]=list_r[48];		
		end
		S_load:
		begin
			list_w[0]=((state_r==S_load)&&(pos_w[0]==1'b1))?list_r[0]:in_r;
			list_w[1]=(pos_w[1]==1'b1)?list_r[1]:((pos_w[0]==1'b1)&&(pos_w[1]==1'b0))?in_r:list_r[0];
			list_w[2]=(pos_w[2]==1'b1)?list_r[2]:((pos_w[1]==1'b1)&&(pos_w[2]==1'b0))?in_r:list_r[1];
			list_w[3]=(pos_w[3]==1'b1)?list_r[3]:((pos_w[2]==1'b1)&&(pos_w[3]==1'b0))?in_r:list_r[2];
			list_w[4]=(pos_w[4]==1'b1)?list_r[4]:((pos_w[3]==1'b1)&&(pos_w[4]==1'b0))?in_r:list_r[3];
			list_w[5]=(pos_w[5]==1'b1)?list_r[5]:((pos_w[4]==1'b1)&&(pos_w[5]==1'b0))?in_r:list_r[4];
			list_w[6]=(pos_w[6]==1'b1)?list_r[6]:((pos_w[5]==1'b1)&&(pos_w[6]==1'b0))?in_r:list_r[5];
			list_w[7]=(pos_w[7]==1'b1)?list_r[7]:((pos_w[6]==1'b1)&&(pos_w[7]==1'b0))?in_r:list_r[6];
			list_w[8]=(pos_w[8]==1'b1)?list_r[8]:((pos_w[7]==1'b1)&&(pos_w[8]==1'b0))?in_r:list_r[7];
			list_w[9]=(pos_w[9]==1'b1)?list_r[9]:((pos_w[8]==1'b1)&&(pos_w[9]==1'b0))?in_r:list_r[8];
			list_w[10]=(pos_w[10]==1'b1)?list_r[10]:((pos_w[9]==1'b1)&&(pos_w[10]==1'b0))?in_r:list_r[9];
			list_w[11]=(pos_w[11]==1'b1)?list_r[11]:((pos_w[10]==1'b1)&&(pos_w[11]==1'b0))?in_r:list_r[10];
			list_w[12]=(pos_w[12]==1'b1)?list_r[12]:((pos_w[11]==1'b1)&&(pos_w[12]==1'b0))?in_r:list_r[11];
			list_w[13]=(pos_w[13]==1'b1)?list_r[13]:((pos_w[12]==1'b1)&&(pos_w[13]==1'b0))?in_r:list_r[12];
			list_w[14]=(pos_w[14]==1'b1)?list_r[14]:((pos_w[13]==1'b1)&&(pos_w[14]==1'b0))?in_r:list_r[13];
			list_w[15]=(pos_w[15]==1'b1)?list_r[15]:((pos_w[14]==1'b1)&&(pos_w[15]==1'b0))?in_r:list_r[14];
			list_w[16]=(pos_w[16]==1'b1)?list_r[16]:((pos_w[15]==1'b1)&&(pos_w[16]==1'b0))?in_r:list_r[15];
			list_w[17]=(pos_w[17]==1'b1)?list_r[17]:((pos_w[16]==1'b1)&&(pos_w[17]==1'b0))?in_r:list_r[16];
			list_w[18]=(pos_w[18]==1'b1)?list_r[18]:((pos_w[17]==1'b1)&&(pos_w[18]==1'b0))?in_r:list_r[17];
			list_w[19]=(pos_w[19]==1'b1)?list_r[19]:((pos_w[18]==1'b1)&&(pos_w[19]==1'b0))?in_r:list_r[18];
			list_w[20]=(pos_w[20]==1'b1)?list_r[20]:((pos_w[19]==1'b1)&&(pos_w[20]==1'b0))?in_r:list_r[19];
			list_w[21]=(pos_w[21]==1'b1)?list_r[21]:((pos_w[20]==1'b1)&&(pos_w[21]==1'b0))?in_r:list_r[20];
			list_w[22]=(pos_w[22]==1'b1)?list_r[22]:((pos_w[21]==1'b1)&&(pos_w[22]==1'b0))?in_r:list_r[21];
			list_w[23]=(pos_w[23]==1'b1)?list_r[23]:((pos_w[22]==1'b1)&&(pos_w[23]==1'b0))?in_r:list_r[22];
			list_w[24]=(pos_w[24]==1'b1)?list_r[24]:((pos_w[23]==1'b1)&&(pos_w[24]==1'b0))?in_r:list_r[23];
			list_w[25]=(pos_w[25]==1'b1)?list_r[25]:((pos_w[24]==1'b1)&&(pos_w[25]==1'b0))?in_r:list_r[24];
			list_w[26]=(pos_w[26]==1'b1)?list_r[26]:((pos_w[25]==1'b1)&&(pos_w[26]==1'b0))?in_r:list_r[25];
			list_w[27]=(pos_w[27]==1'b1)?list_r[27]:((pos_w[26]==1'b1)&&(pos_w[27]==1'b0))?in_r:list_r[26];
			list_w[28]=(pos_w[28]==1'b1)?list_r[28]:((pos_w[27]==1'b1)&&(pos_w[28]==1'b0))?in_r:list_r[27];
			list_w[29]=(pos_w[29]==1'b1)?list_r[29]:((pos_w[28]==1'b1)&&(pos_w[29]==1'b0))?in_r:list_r[28];
			list_w[30]=(pos_w[30]==1'b1)?list_r[30]:((pos_w[29]==1'b1)&&(pos_w[30]==1'b0))?in_r:list_r[29];
			list_w[31]=(pos_w[31]==1'b1)?list_r[31]:((pos_w[30]==1'b1)&&(pos_w[31]==1'b0))?in_r:list_r[30];	
			list_w[32]=(pos_w[32]==1'b1)?list_r[32]:((pos_w[31]==1'b1)&&(pos_w[32]==1'b0))?in_r:list_r[31];
			list_w[33]=(pos_w[33]==1'b1)?list_r[33]:((pos_w[32]==1'b1)&&(pos_w[33]==1'b0))?in_r:list_r[32];	
			list_w[34]=(pos_w[34]==1'b1)?list_r[34]:((pos_w[33]==1'b1)&&(pos_w[34]==1'b0))?in_r:list_r[33];
			list_w[35]=(pos_w[35]==1'b1)?list_r[35]:((pos_w[34]==1'b1)&&(pos_w[35]==1'b0))?in_r:list_r[34];	
			list_w[36]=(pos_w[36]==1'b1)?list_r[36]:((pos_w[35]==1'b1)&&(pos_w[36]==1'b0))?in_r:list_r[35];
			list_w[37]=(pos_w[37]==1'b1)?list_r[37]:((pos_w[36]==1'b1)&&(pos_w[37]==1'b0))?in_r:list_r[36];	
			list_w[38]=(pos_w[38]==1'b1)?list_r[38]:((pos_w[37]==1'b1)&&(pos_w[38]==1'b0))?in_r:list_r[37];
			list_w[39]=(pos_w[39]==1'b1)?list_r[39]:((pos_w[38]==1'b1)&&(pos_w[39]==1'b0))?in_r:list_r[38];	
			list_w[40]=(pos_w[40]==1'b1)?list_r[40]:((pos_w[39]==1'b1)&&(pos_w[40]==1'b0))?in_r:list_r[39];
			list_w[41]=(pos_w[41]==1'b1)?list_r[41]:((pos_w[40]==1'b1)&&(pos_w[41]==1'b0))?in_r:list_r[40];	
			list_w[42]=(pos_w[42]==1'b1)?list_r[42]:((pos_w[41]==1'b1)&&(pos_w[42]==1'b0))?in_r:list_r[41];
			list_w[43]=(pos_w[43]==1'b1)?list_r[43]:((pos_w[42]==1'b1)&&(pos_w[43]==1'b0))?in_r:list_r[42];	
			list_w[44]=(pos_w[44]==1'b1)?list_r[44]:((pos_w[43]==1'b1)&&(pos_w[44]==1'b0))?in_r:list_r[43];
			list_w[45]=(pos_w[45]==1'b1)?list_r[45]:((pos_w[44]==1'b1)&&(pos_w[45]==1'b0))?in_r:list_r[44];	
			list_w[46]=(pos_w[46]==1'b1)?list_r[46]:((pos_w[45]==1'b1)&&(pos_w[46]==1'b0))?in_r:list_r[45];
			list_w[47]=(pos_w[47]==1'b1)?list_r[47]:((pos_w[46]==1'b1)&&(pos_w[47]==1'b0))?in_r:list_r[46];				
			list_w[48]=(pos_w[48]==1'b1)?list_r[48]:((pos_w[47]==1'b1)&&(pos_w[48]==1'b0))?in_r:list_r[47];					
		end
		S_done:
		begin
			list_w[0]=list_r[0];
			list_w[1]=list_r[1];
			list_w[2]=list_r[2];
			list_w[3]=list_r[3];
			list_w[4]=list_r[4];
			list_w[5]=list_r[5];
			list_w[6]=list_r[6];
			list_w[7]=list_r[7];
			list_w[8]=list_r[8];
			list_w[9]=list_r[9];
			list_w[10]=list_r[10];
			list_w[11]=list_r[11];
			list_w[12]=list_r[12];
			list_w[13]=list_r[13];
			list_w[14]=list_r[14];
			list_w[15]=list_r[15];
			list_w[16]=list_r[16];
			list_w[17]=list_r[17];
			list_w[18]=list_r[18];
			list_w[19]=list_r[19];
			list_w[20]=list_r[20];
			list_w[21]=list_r[21];
			list_w[22]=list_r[22];
			list_w[23]=list_r[23];
			list_w[24]=list_r[24];
			list_w[25]=list_r[25];
			list_w[26]=list_r[26];
			list_w[27]=list_r[27];
			list_w[28]=list_r[28];
			list_w[29]=list_r[29];
			list_w[30]=list_r[30];
			list_w[31]=list_r[31];
			list_w[32]=list_r[32];
			list_w[33]=list_r[33];
			list_w[34]=list_r[34];
			list_w[35]=list_r[35];
			list_w[36]=list_r[36];
			list_w[37]=list_r[37];
			list_w[38]=list_r[38];
			list_w[39]=list_r[39];
			list_w[40]=list_r[40];
			list_w[41]=list_r[41];
			list_w[42]=list_r[42];
			list_w[43]=list_r[43];	
			list_w[44]=list_r[44];
			list_w[45]=list_r[45];
			list_w[46]=list_r[46];
			list_w[47]=list_r[47];
			list_w[48]=list_r[48];					
		end
		S_dele:
		begin
			list_w[0]=(pos_w[0]==1'b1)?list_r[0]:list_r[1];
			list_w[1]=(pos_w[1]==1'b1)?list_r[1]:list_r[2];
			list_w[2]=(pos_w[2]==1'b1)?list_r[2]:list_r[3];
			list_w[3]=(pos_w[3]==1'b1)?list_r[3]:list_r[4];
			list_w[4]=(pos_w[4]==1'b1)?list_r[4]:list_r[5];
			list_w[5]=(pos_w[5]==1'b1)?list_r[5]:list_r[6];
			list_w[6]=(pos_w[6]==1'b1)?list_r[6]:list_r[7];
			list_w[7]=(pos_w[7]==1'b1)?list_r[7]:list_r[8];
			list_w[8]=(pos_w[8]==1'b1)?list_r[8]:list_r[9];
			list_w[9]=(pos_w[9]==1'b1)?list_r[9]:list_r[10];
			list_w[10]=(pos_w[10]==1'b1)?list_r[10]:list_r[11];
			list_w[11]=(pos_w[11]==1'b1)?list_r[11]:list_r[12];
			list_w[12]=(pos_w[12]==1'b1)?list_r[12]:list_r[13];
			list_w[13]=(pos_w[13]==1'b1)?list_r[13]:list_r[14];
			list_w[14]=(pos_w[14]==1'b1)?list_r[14]:list_r[15];
			list_w[15]=(pos_w[15]==1'b1)?list_r[15]:list_r[16];
			list_w[16]=(pos_w[16]==1'b1)?list_r[16]:list_r[17];
			list_w[17]=(pos_w[17]==1'b1)?list_r[17]:list_r[18];
			list_w[18]=(pos_w[18]==1'b1)?list_r[18]:list_r[19];
			list_w[19]=(pos_w[19]==1'b1)?list_r[19]:list_r[20];
			list_w[20]=(pos_w[20]==1'b1)?list_r[20]:list_r[21];
			list_w[21]=(pos_w[21]==1'b1)?list_r[21]:list_r[22];
			list_w[22]=(pos_w[22]==1'b1)?list_r[22]:list_r[23];
			list_w[23]=(pos_w[23]==1'b1)?list_r[23]:list_r[24];
			list_w[24]=(pos_w[24]==1'b1)?list_r[24]:list_r[25];
			list_w[25]=(pos_w[25]==1'b1)?list_r[25]:list_r[26];
			list_w[26]=(pos_w[26]==1'b1)?list_r[26]:list_r[27];
			list_w[27]=(pos_w[27]==1'b1)?list_r[27]:list_r[28];
			list_w[28]=(pos_w[28]==1'b1)?list_r[28]:list_r[29];
			list_w[29]=(pos_w[29]==1'b1)?list_r[29]:list_r[30];
			list_w[30]=(pos_w[30]==1'b1)?list_r[30]:list_r[31];
			list_w[31]=(pos_w[31]==1'b1)?list_r[31]:list_r[32];
			list_w[32]=(pos_w[32]==1'b1)?list_r[32]:list_r[33];
			list_w[33]=(pos_w[33]==1'b1)?list_r[33]:list_r[34];
			list_w[34]=(pos_w[34]==1'b1)?list_r[34]:list_r[35];
			list_w[35]=(pos_w[35]==1'b1)?list_r[35]:list_r[36];
			list_w[36]=(pos_w[36]==1'b1)?list_r[36]:list_r[37];
			list_w[37]=(pos_w[37]==1'b1)?list_r[37]:list_r[38];
			list_w[38]=(pos_w[38]==1'b1)?list_r[38]:list_r[39];
			list_w[39]=(pos_w[39]==1'b1)?list_r[39]:list_r[40];
			list_w[40]=(pos_w[40]==1'b1)?list_r[40]:list_r[41];
			list_w[41]=(pos_w[41]==1'b1)?list_r[41]:list_r[42];
			list_w[42]=(pos_w[42]==1'b1)?list_r[42]:list_r[43];
			list_w[43]=(pos_w[43]==1'b1)?list_r[43]:list_r[44];
			list_w[44]=(pos_w[44]==1'b1)?list_r[44]:list_r[45];
			list_w[45]=(pos_w[45]==1'b1)?list_r[45]:list_r[46];
			list_w[46]=(pos_w[46]==1'b1)?list_r[46]:list_r[47];
			list_w[47]=(pos_w[47]==1'b1)?list_r[47]:list_r[48];
			list_w[48]=(pos_w[48]==1'b1)?list_r[48]:8'd255;			
		end	
		default:
		begin
			list_w[0]=list_r[0];
			list_w[1]=list_r[1];
			list_w[2]=list_r[2];
			list_w[3]=list_r[3];
			list_w[4]=list_r[4];
			list_w[5]=list_r[5];
			list_w[6]=list_r[6];
			list_w[7]=list_r[7];
			list_w[8]=list_r[8];
			list_w[9]=list_r[9];
			list_w[10]=list_r[10];
			list_w[11]=list_r[11];
			list_w[12]=list_r[12];
			list_w[13]=list_r[13];
			list_w[14]=list_r[14];
			list_w[15]=list_r[15];
			list_w[16]=list_r[16];
			list_w[17]=list_r[17];
			list_w[18]=list_r[18];
			list_w[19]=list_r[19];
			list_w[20]=list_r[20];
			list_w[21]=list_r[21];
			list_w[22]=list_r[22];
			list_w[23]=list_r[23];
			list_w[24]=list_r[24];
			list_w[25]=list_r[25];
			list_w[26]=list_r[26];
			list_w[27]=list_r[27];
			list_w[28]=list_r[28];
			list_w[29]=list_r[29];
			list_w[30]=list_r[30];
			list_w[31]=list_r[31];
			list_w[32]=list_r[32];
			list_w[33]=list_r[33];
			list_w[34]=list_r[34];
			list_w[35]=list_r[35];
			list_w[36]=list_r[36];
			list_w[37]=list_r[37];
			list_w[38]=list_r[38];
			list_w[39]=list_r[39];
			list_w[40]=list_r[40];
			list_w[41]=list_r[41];
			list_w[42]=list_r[42];
			list_w[43]=list_r[43];	
			list_w[44]=list_r[44];
			list_w[45]=list_r[45];
			list_w[46]=list_r[46];
			list_w[47]=list_r[47];
			list_w[48]=list_r[48];
		end
	endcase		
end

always@(*)
begin
	case(state_r)
		S_idle: begin if(data_valid) state_w=S_load; else if(del_valid) state_w=S_dele; else state_w=S_idle; end
		S_load: begin if(data_valid) state_w=S_load; else state_w=S_done; end
		S_dele: begin if(del_valid) state_w=S_dele; else state_w=S_done; end
		S_done: begin if(del_valid) state_w=S_dele; else if(data_valid) state_w=S_load; else state_w=S_idle; end
		default: state_w=state_r;
	endcase
end

always@(posedge clk or posedge rst or posedge newline)
begin
	if(rst)
	begin
		in_r<=7'b0;
		counter_r<=7'b0;
        state_r<=2'b0;	
		list_r[0]<=8'd0;
		list_r[1]<=8'd0;		
		list_r[2]<=8'd0;		
		list_r[3]<=8'd0;		
		list_r[4]<=8'd0;		
		list_r[5]<=8'd0;		
		list_r[6]<=8'd0;		
		list_r[7]<=8'd0;		
		list_r[8]<=8'd0;		
		list_r[9]<=8'd0;		
		list_r[10]<=8'd0;		
		list_r[11]<=8'd0;		
		list_r[12]<=8'd0;		
		list_r[13]<=8'd0;		
		list_r[14]<=8'd0;		
		list_r[15]<=8'd0;		
		list_r[16]<=8'd0;		
		list_r[17]<=8'd0;		
		list_r[18]<=8'd0;		
		list_r[19]<=8'd0;		
		list_r[20]<=8'd0;		
		list_r[21]<=8'd255;		
		list_r[22]<=8'd255;		
		list_r[23]<=8'd255;		
		list_r[24]<=8'd255;		
		list_r[25]<=8'd255;		
		list_r[26]<=8'd255;		
		list_r[27]<=8'd255;		
		list_r[28]<=8'd255;		
		list_r[29]<=8'd255;		
		list_r[30]<=8'd255;		
		list_r[31]<=8'd255;		
		list_r[32]<=8'd255;		
		list_r[33]<=8'd255;		
		list_r[34]<=8'd255;		
		list_r[35]<=8'd255;		
		list_r[36]<=8'd255;		
		list_r[37]<=8'd255;		
		list_r[38]<=8'd255;		
		list_r[39]<=8'd255;		
		list_r[40]<=8'd255;		
		list_r[41]<=8'd255;		
		list_r[42]<=8'd255;		
		list_r[43]<=8'd255;		
		list_r[44]<=8'd255;		
		list_r[45]<=8'd255;		
		list_r[46]<=8'd255;		
		list_r[47]<=8'd255;		
		list_r[48]<=8'd255;		
	end
	else if(newline)
	begin
		in_r<=7'b0;
		counter_r<=7'b0;
        state_r<=2'b0;	
		list_r[0]<=8'd0;
		list_r[1]<=8'd0;		
		list_r[2]<=8'd0;		
		list_r[3]<=8'd0;		
		list_r[4]<=8'd0;		
		list_r[5]<=8'd0;		
		list_r[6]<=8'd0;		
		list_r[7]<=8'd0;		
		list_r[8]<=8'd0;		
		list_r[9]<=8'd0;		
		list_r[10]<=8'd0;		
		list_r[11]<=8'd0;		
		list_r[12]<=8'd0;		
		list_r[13]<=8'd0;		
		list_r[14]<=8'd0;		
		list_r[15]<=8'd0;		
		list_r[16]<=8'd0;		
		list_r[17]<=8'd0;		
		list_r[18]<=8'd0;		
		list_r[19]<=8'd0;		
		list_r[20]<=8'd0;		
		list_r[21]<=8'd255;		
		list_r[22]<=8'd255;		
		list_r[23]<=8'd255;		
		list_r[24]<=8'd255;		
		list_r[25]<=8'd255;		
		list_r[26]<=8'd255;		
		list_r[27]<=8'd255;		
		list_r[28]<=8'd255;		
		list_r[29]<=8'd255;		
		list_r[30]<=8'd255;		
		list_r[31]<=8'd255;		
		list_r[32]<=8'd255;		
		list_r[33]<=8'd255;		
		list_r[34]<=8'd255;		
		list_r[35]<=8'd255;		
		list_r[36]<=8'd255;		
		list_r[37]<=8'd255;		
		list_r[38]<=8'd255;		
		list_r[39]<=8'd255;		
		list_r[40]<=8'd255;		
		list_r[41]<=8'd255;		
		list_r[42]<=8'd255;		
		list_r[43]<=8'd255;		
		list_r[44]<=8'd255;		
		list_r[45]<=8'd255;		
		list_r[46]<=8'd255;		
		list_r[47]<=8'd255;		
		list_r[48]<=8'd255;		
	end	
	else
	begin	
		in_r<=data_in;
		counter_r<=counter_w;
        state_r<=state_w;	
		list_r[0]<=list_w[0];
		list_r[1]<=list_w[1];		
		list_r[2]<=list_w[2];		
		list_r[3]<=list_w[3];		
		list_r[4]<=list_w[4];		
		list_r[5]<=list_w[5];		
		list_r[6]<=list_w[6];		
		list_r[7]<=list_w[7];		
		list_r[8]<=list_w[8];		
		list_r[9]<=list_w[9];		
		list_r[10]<=list_w[10];
		list_r[11]<=list_w[11];
		list_r[12]<=list_w[12];
		list_r[13]<=list_w[13];
		list_r[14]<=list_w[14];
		list_r[15]<=list_w[15];
		list_r[16]<=list_w[16];
		list_r[17]<=list_w[17];
		list_r[18]<=list_w[18];
		list_r[19]<=list_w[19];
		list_r[20]<=list_w[20];
		list_r[21]<=list_w[21];
		list_r[22]<=list_w[22];
		list_r[23]<=list_w[23];
		list_r[24]<=list_w[24];
		list_r[25]<=list_w[25];
		list_r[26]<=list_w[26];
		list_r[27]<=list_w[27];
		list_r[28]<=list_w[28];
		list_r[29]<=list_w[29];
		list_r[30]<=list_w[30];
		list_r[31]<=list_w[31];
		list_r[32]<=list_w[32];
		list_r[33]<=list_w[33];
		list_r[34]<=list_w[34];
		list_r[35]<=list_w[35];
		list_r[36]<=list_w[36];
		list_r[37]<=list_w[37];
		list_r[38]<=list_w[38];
		list_r[39]<=list_w[39];
		list_r[40]<=list_w[40];
		list_r[41]<=list_w[41];
		list_r[42]<=list_w[42];
		list_r[43]<=list_w[43];
		list_r[44]<=list_w[44];
		list_r[45]<=list_w[45];
		list_r[46]<=list_w[46];
		list_r[47]<=list_w[47];
		list_r[48]<=list_w[48];	
	end
end

endmodule


module control ( clk, rst, data_in, in_en, busy, med_data, med_en, med_del, cen, wen, addr, memd, memq, out_valid, newline);
input   clk;
input   rst;
input   in_en;
input   [7:0] data_in;
input   [7:0] memq;
output  [7:0] memd;
output  cen;
output  wen;
output  busy;
output  med_en;
output  med_del;
output  newline;
output  out_valid;
output  [7:0] med_data;
output  [9:0] addr;

parameter S_init=3'd0;
parameter S_prep=3'd1;
parameter S_getw=3'd2;
parameter S_work=3'd3;
parameter S_endl=3'd4;

reg [2:0] state_r,state_w;

reg [6:0] counter_row_r;
wire [6:0] counter_row_w;
reg [6:0] counter_col_r;
wire [6:0] counter_col_w;

reg [6:0] countwin_row_r;
wire [6:0] countwin_row_w;
reg [6:0] countwin_col_r;
wire [6:0] countwin_col_w;

reg wen_r;
reg wen_w;

reg cen_r;
reg cen_w;

reg [9:0] addr_r;
reg [9:0] addr_w;

reg [7:0] work_counter;

reg [5:0] getw_counter;
wire [5:0] getw_counter_w;

reg busy_r;
reg busy_w;

reg out_v_r;
reg out_v_w;

reg med_en_r,med_en_w;
reg med_del_r,med_del_w;
reg [7:0] med_data_r,med_data_w;

integer k;

reg [7:0] data_r;
wire [7:0] data_w;

reg readfin;
wire readfin_w;

wire [6:0] mask_row;
wire [2:0] addr_shift_0;
wire [2:0] addr_shift_1;
wire [2:0] addr_shift_2;
wire [2:0] addr_shift_3;
wire [2:0] addr_shift_4;
wire [2:0] addr_shift_5;
wire [2:0] addr_shift_6;
wire [2:0] addr_shift_7;

assign busy=busy_r;
assign wen=wen_r;
assign cen=cen_r;

assign memd=data_r;

assign med_data=med_data_r;
assign med_del=med_del_r;
assign med_en=med_en_r;

assign counter_col_w=(in_en)?counter_col_r+7'b1:counter_col_r;
assign counter_row_w=(in_en&&counter_col_r==7'd127)?counter_row_r+7'b1:counter_row_r;

assign countwin_col_w=(out_valid)?countwin_col_r+7'b1:countwin_col_r;
assign countwin_row_w=(countwin_col_w==7'd0 && out_valid)?countwin_row_r+7'b1:countwin_row_r;

assign mask_row=(countwin_row_w==7'd0)?7'b000_0_111:(countwin_row_w==7'd1)?7'b000_0_011:(countwin_row_w==7'd2)?7'b000_0_001:(countwin_row_w==7'd125)?7'b100_0_000:(countwin_row_w==7'd126)?7'b110_0_000:(countwin_row_w==7'd127)?7'b111_0_000:7'b0;

assign addr_shift_0=(countwin_row_w[2:0]==3'd5)?(countwin_row_w[5:3]+3'd1):(countwin_row_w[2:0]==3'd6)?(countwin_row_w[5:3]+3'd1):(countwin_row_w[2:0]==3'd7)?(countwin_row_w[5:3]+3'd1):countwin_row_w[5:3];
assign addr_shift_1=(countwin_row_w[2:0]==3'd6)?(countwin_row_w[5:3]+3'd1):(countwin_row_w[2:0]==3'd7)?(countwin_row_w[5:3]+3'd1):countwin_row_w[5:3];
assign addr_shift_2=(countwin_row_w[2:0]==3'd7)?(countwin_row_w[5:3]+3'd1):countwin_row_w[5:3];
assign addr_shift_3=countwin_row_w[5:3];
assign addr_shift_4=countwin_row_w[5:3];
assign addr_shift_5=(countwin_row_w[2:0]==3'd0)?(countwin_row_w[5:3]-3'd1):countwin_row_w[5:3];	
assign addr_shift_6=(countwin_row_w[2:0]==3'd1)?(countwin_row_w[5:3]-3'd1):(countwin_row_w[2:0]==3'd0)?(countwin_row_w[5:3]-3'd1):countwin_row_w[5:3];
assign addr_shift_7=(countwin_row_w[2:0]==3'd2)?(countwin_row_w[5:3]-3'd1):(countwin_row_w[2:0]==3'd1)?(countwin_row_w[5:3]-3'd1):(countwin_row_w[2:0]==3'd0)?(countwin_row_w[5:3]-3'd1):countwin_row_w[5:3];

assign out_valid=(work_counter==8'd34)?1'b1:(getw_counter==5'd19)?1'b1:1'b0;
assign newline=(state_r==S_endl)?1'b1:1'b0;

assign data_w=(in_en)?data_in:data_r;
assign getw_counter_w=(state_r==S_getw)?(getw_counter<19)?getw_counter+5'd1:5'd0:5'd0;
assign readfin_w=(counter_col_r==7'd127 && counter_row_r ==7'd127)?1'b1:readfin;
assign addr=addr_r;

always@(*)
begin
	case(state_r)
	S_endl:
	begin
		//--------------------------------------------------------
		busy_w=1'b1;
		cen_w=1'b0;
		wen_w=(readfin==1'b0)?1'b0:1'b1;
		addr_w=(readfin==1'b0)?{counter_row_r[2:0],7'b0}:{countwin_row_r[2:0],countwin_col_r};
		//--------------------------------------------------------
		med_en_w=1'd0;
		med_del_w=1'd0;
		med_data_w=8'd255;
	end
	S_prep:
	begin
		//--------------------------------------------------------
		busy_w=1'b0;
		cen_w=1'b0;	
		wen_w=1'b0;	
		addr_w={counter_row_r[2:0],counter_col_r};
		//--------------------------------------------------------	
		med_en_w=1'd0;
		med_del_w=1'd0;
		med_data_w=8'd255;
	end
	S_init:
	begin
		//--------------------------------------------------------
		busy_w=1'b0;
		cen_w=1'b0;
		wen_w=1'b0;	
		addr_w=10'd0;
		//--------------------------------------------------------
		med_en_w=1'd0;
		med_del_w=1'd0;
		med_data_w=8'd255;		
	end
	S_getw:
	begin
		//--------------------------------------------------------
		busy_w=1'b1;		
		cen_w=1'b0;
		wen_w=1'b1;	
		//--------------------------------------------------------
		case(getw_counter)
			5'd0: begin addr_w={(countwin_row_r[2:0]-3'd3),countwin_col_r-7'd4}; end
			5'd1: begin addr_w={(countwin_row_r[2:0]-3'd2),countwin_col_r-7'd4}; end
			5'd2: begin addr_w={(countwin_row_r[2:0]-3'd1),countwin_col_r-7'd4}; end		
			5'd3: begin addr_w={(countwin_row_r[2:0]),countwin_col_r-7'd4}; end
			5'd4: begin addr_w={(countwin_row_r[2:0]+3'd1),countwin_col_r-7'd4}; end
			5'd5: begin addr_w={(countwin_row_r[2:0]+3'd2),countwin_col_r-7'd4}; end	
			5'd6: begin addr_w={(countwin_row_r[2:0]+3'd3),countwin_col_r-7'd4}; end
			
			5'd8: begin addr_w={(countwin_row_r[2:0]-3'd3),countwin_col_r+7'd3}; end
			5'd9: begin addr_w={(countwin_row_r[2:0]-3'd2),countwin_col_r+7'd3}; end
			5'd10: begin addr_w={(countwin_row_r[2:0]-3'd1),countwin_col_r+7'd3}; end
			5'd11: begin addr_w={(countwin_row_r[2:0]),countwin_col_r+7'd3}; end
			5'd12: begin addr_w={(countwin_row_r[2:0]+3'd1),countwin_col_r+7'd3}; end
			5'd13: begin addr_w={(countwin_row_r[2:0]+3'd2),countwin_col_r+7'd3}; end
			5'd14: begin addr_w={(countwin_row_r[2:0]+3'd3),countwin_col_r+7'd3}; end
			default: begin addr_w=addr_r; end
		endcase
		case(getw_counter)	
			5'd1: begin med_data_w=(mask_row[0])?8'd0:(countwin_col_r>3)?memq:8'd0; med_en_w=1'd0; med_del_w=1'd1; end
			5'd2: begin med_data_w=(mask_row[1])?8'd0:(countwin_col_r>3)?memq:8'd0; med_en_w=1'd0; med_del_w=1'd1; end
			5'd3: begin med_data_w=(mask_row[2])?8'd0:(countwin_col_r>3)?memq:8'd0; med_en_w=1'd0; med_del_w=1'd1; end	
			5'd4: begin med_data_w=(mask_row[3])?8'd0:(countwin_col_r>3)?memq:8'd0; med_en_w=1'd0; med_del_w=1'd1; end
			5'd5: begin med_data_w=(mask_row[4])?8'd0:(countwin_col_r>3)?memq:8'd0; med_en_w=1'd0; med_del_w=1'd1; end
			5'd6: begin med_data_w=(mask_row[5])?8'd0:(countwin_col_r>3)?memq:8'd0; med_en_w=1'd0; med_del_w=1'd1; end
			5'd7: begin med_data_w=(mask_row[6])?8'd0:(countwin_col_r>3)?memq:8'd0; med_en_w=1'd0; med_del_w=1'd1; end
			
			5'd9: begin med_data_w=(mask_row[0])?8'd0:(countwin_col_r<=124)?memq:8'd0; med_en_w=1'd1; med_del_w=1'd0; end
			5'd10: begin med_data_w=(mask_row[1])?8'd0:(countwin_col_r<=124)?memq:8'd0; med_en_w=1'd1; med_del_w=1'd0; end
			5'd11: begin med_data_w=(mask_row[2])?8'd0:(countwin_col_r<=124)?memq:8'd0; med_en_w=1'd1; med_del_w=1'd0; end
			5'd12: begin med_data_w=(mask_row[3])?8'd0:(countwin_col_r<=124)?memq:8'd0; med_en_w=1'd1; med_del_w=1'd0; end
			5'd13: begin med_data_w=(mask_row[4])?8'd0:(countwin_col_r<=124)?memq:8'd0; med_en_w=1'd1; med_del_w=1'd0; end
			5'd14: begin med_data_w=(mask_row[5])?8'd0:(countwin_col_r<=124)?memq:8'd0; med_en_w=1'd1; med_del_w=1'd0; end
			5'd15: begin med_data_w=(mask_row[6])?8'd0:(countwin_col_r<=124)?memq:8'd0; med_en_w=1'd1; med_del_w=1'd0; end	
			default: begin med_data_w=8'd255; med_en_w=1'd0; med_del_w=1'd0; end
		endcase
	end
	S_work:
	begin	
		//--------------------------------------------------------
		busy_w=1'b1;	
		cen_w=1'b0;
		wen_w=1'b1;
		//--------------------------------------------------------
		med_del_w=1'b0;	
		case(work_counter)
			8'd0: begin addr_w={(countwin_row_r[2:0]-3'd3),countwin_col_r}; end
			8'd1: begin addr_w={(countwin_row_r[2:0]-3'd2),countwin_col_r}; end
			8'd2: begin addr_w={(countwin_row_r[2:0]-3'd1),countwin_col_r}; end		
			8'd3: begin addr_w={(countwin_row_r[2:0]),countwin_col_r}; end
			8'd4: begin addr_w={(countwin_row_r[2:0]+3'd1),countwin_col_r}; end
			8'd5: begin addr_w={(countwin_row_r[2:0]+3'd2),countwin_col_r}; end	
			8'd6: begin addr_w={(countwin_row_r[2:0]+3'd3),countwin_col_r}; end
			
			8'd8: begin addr_w={(countwin_row_r[2:0]-3'd3),countwin_col_r+7'd1}; end
			8'd9: begin addr_w={(countwin_row_r[2:0]-3'd2),countwin_col_r+7'd1}; end
			8'd10: begin addr_w={(countwin_row_r[2:0]-3'd1),countwin_col_r+7'd1}; end
			8'd11: begin addr_w={(countwin_row_r[2:0]),countwin_col_r+7'd1}; end
			8'd12: begin addr_w={(countwin_row_r[2:0]+3'd1),countwin_col_r+7'd1}; end
			8'd13: begin addr_w={(countwin_row_r[2:0]+3'd2),countwin_col_r+7'd1}; end
			8'd14: begin addr_w={(countwin_row_r[2:0]+3'd3),countwin_col_r+7'd1}; end
		
			8'd16: begin addr_w={(countwin_row_r[2:0]-3'd3),countwin_col_r+7'd2}; end
			8'd17: begin addr_w={(countwin_row_r[2:0]-3'd2),countwin_col_r+7'd2}; end
			8'd18: begin addr_w={(countwin_row_r[2:0]-3'd1),countwin_col_r+7'd2}; end
			8'd19: begin addr_w={(countwin_row_r[2:0]),countwin_col_r+7'd2}; end
			8'd20: begin addr_w={(countwin_row_r[2:0]+3'd1),countwin_col_r+7'd2}; end
			8'd21: begin addr_w={(countwin_row_r[2:0]+3'd2),countwin_col_r+7'd2}; end
			8'd22: begin addr_w={(countwin_row_r[2:0]+3'd3),countwin_col_r+7'd2}; end	
            
			8'd24: begin addr_w={(countwin_row_r[2:0]-3'd3),countwin_col_r+7'd3}; end
			8'd25: begin addr_w={(countwin_row_r[2:0]-3'd2),countwin_col_r+7'd3}; end
			8'd26: begin addr_w={(countwin_row_r[2:0]-3'd1),countwin_col_r+7'd3}; end
			8'd27: begin addr_w={(countwin_row_r[2:0]),countwin_col_r+7'd3}; end
			8'd28: begin addr_w={(countwin_row_r[2:0]+3'd1),countwin_col_r+7'd3}; end
			8'd29: begin addr_w={(countwin_row_r[2:0]+3'd2),countwin_col_r+7'd3}; end
			8'd30: begin addr_w={(countwin_row_r[2:0]+3'd3),countwin_col_r+7'd3}; end
			
			default: begin addr_w=addr_r; end
		endcase
		case(work_counter)	
			8'd1: begin med_data_w=(mask_row[0])?8'd0:memq; med_en_w=1'd1; end
			8'd2: begin med_data_w=(mask_row[1])?8'd0:memq; med_en_w=1'd1; end
			8'd3: begin med_data_w=(mask_row[2])?8'd0:memq; med_en_w=1'd1; end	
			8'd4: begin med_data_w=(mask_row[3])?8'd0:memq; med_en_w=1'd1; end
			8'd5: begin med_data_w=(mask_row[4])?8'd0:memq; med_en_w=1'd1; end
			8'd6: begin med_data_w=(mask_row[5])?8'd0:memq; med_en_w=1'd1; end
			8'd7: begin med_data_w=(mask_row[6])?8'd0:memq; med_en_w=1'd1; end
			
			8'd9: begin med_data_w=(mask_row[0])?8'd0:memq; med_en_w=1'd1; end
			8'd10: begin med_data_w=(mask_row[1])?8'd0:memq; med_en_w=1'd1; end
			8'd11: begin med_data_w=(mask_row[2])?8'd0:memq; med_en_w=1'd1; end
			8'd12: begin med_data_w=(mask_row[3])?8'd0:memq; med_en_w=1'd1; end
			8'd13: begin med_data_w=(mask_row[4])?8'd0:memq; med_en_w=1'd1; end
			8'd14: begin med_data_w=(mask_row[5])?8'd0:memq; med_en_w=1'd1; end
			8'd15: begin med_data_w=(mask_row[6])?8'd0:memq; med_en_w=1'd1; end	
			
			8'd17: begin med_data_w=(mask_row[0])?8'd0:memq; med_en_w=1'd1; end
			8'd18: begin med_data_w=(mask_row[1])?8'd0:memq; med_en_w=1'd1; end
			8'd19: begin med_data_w=(mask_row[2])?8'd0:memq; med_en_w=1'd1; end
			8'd20: begin med_data_w=(mask_row[3])?8'd0:memq; med_en_w=1'd1; end
			8'd21: begin med_data_w=(mask_row[4])?8'd0:memq; med_en_w=1'd1; end
			8'd22: begin med_data_w=(mask_row[5])?8'd0:memq; med_en_w=1'd1; end
			8'd23: begin med_data_w=(mask_row[6])?8'd0:memq; med_en_w=1'd1; end	
            
			8'd25: begin med_data_w=(mask_row[0])?8'd0:memq; med_en_w=1'd1; end
			8'd26: begin med_data_w=(mask_row[1])?8'd0:memq; med_en_w=1'd1; end
			8'd27: begin med_data_w=(mask_row[2])?8'd0:memq; med_en_w=1'd1; end
			8'd28: begin med_data_w=(mask_row[3])?8'd0:memq; med_en_w=1'd1; end
			8'd29: begin med_data_w=(mask_row[4])?8'd0:memq; med_en_w=1'd1; end
			8'd30: begin med_data_w=(mask_row[5])?8'd0:memq; med_en_w=1'd1; end
			8'd31: begin med_data_w=(mask_row[6])?8'd0:memq; med_en_w=1'd1; end
			
			default: begin med_data_w=8'd255; med_en_w=1'd0; end
		endcase	
	end
	default:
	begin
		//--------------------------------------------------------
		busy_w=1'b0;
		cen_w=1'b1;
		wen_w=1'b0;
		addr_w=10'd0;
		//--------------------------------------------------------
		med_en_w=1'd0;
		med_del_w=1'd0;
		med_data_w=8'd255;					
	end
	endcase
end


always@(*)
begin
	case(state_r)
		S_init: begin if(in_en) state_w=S_prep; else state_w=S_init; end
		S_prep: begin if(counter_col_r==7'd127 && counter_row_r>7'd3) state_w=S_work; else state_w=S_prep;end
		S_getw: 
		begin 
			if(countwin_col_r==7'd127 && countwin_row_r<7'd127 && getw_counter==5'd19) state_w=S_endl; 
			else if(countwin_col_r==7'd127 && countwin_row_r==7'd127 && getw_counter==5'd19) state_w=S_init; 
			else state_w=S_getw; 
		end
		S_work: begin if(work_counter==8'd33) state_w=S_getw; else state_w=S_work; end
		S_endl: begin if(readfin==1'b0)state_w=S_prep; else state_w=S_work; end
		default:state_w=state_r;
	endcase
end


always@(posedge clk or posedge rst)
begin
	if(rst)
	begin
		readfin<=1'b0;
		state_r<=S_init;
		addr_r<=10'd0;
		out_v_r<=1'b0;
		cen_r<=8'd0;
		wen_r<=8'd0;
		med_en_r<=1'b0;
		med_del_r<=1'b0;
		med_data_r<=8'd0;
		work_counter<=8'd0;
		getw_counter<=5'd0;
		busy_r<=1'b0;
		data_r<=8'd0;
		counter_col_r<=7'b0;
		counter_row_r<=7'b0;
		countwin_col_r<=7'b0;
		countwin_row_r<=7'b0;		

	end
	else
	begin
		readfin<=readfin_w;	
		state_r<=state_w;
		addr_r<=addr_w;
		out_v_r<=1'b0;
		med_data_r<=med_data_w;
		cen_r<=cen_w;
		wen_r<=wen_w;
		med_en_r<=med_en_w;		
		med_del_r<=med_del_w;		
		work_counter<=(state_r==S_work && !in_en)?work_counter+8'd1:8'd0;	
		getw_counter<=getw_counter_w;
		busy_r<=busy_w;
		data_r<=data_w;
		counter_col_r<=counter_col_w;
		counter_row_r<=counter_row_w;		
		countwin_col_r<=countwin_col_w;
		countwin_row_r<=countwin_row_w;	

	end
end

endmodule

