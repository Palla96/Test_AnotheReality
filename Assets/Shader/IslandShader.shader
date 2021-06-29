// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Custom/IslandShader"
{
	Properties
	{
		_Island_DefaultOBJ_Normal("Island_Default OBJ_Normal", 2D) = "bump" {}
		_Dirt_texture("Dirt_texture", 2D) = "white" {}
		_Grass_texture("Grass_texture", 2D) = "white" {}
		_Tiling("Tiling", Float) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
			float4 vertexColor : COLOR;
		};

		uniform sampler2D _Island_DefaultOBJ_Normal;
		uniform float4 _Island_DefaultOBJ_Normal_ST;
		uniform sampler2D _Dirt_texture;
		uniform float _Tiling;
		uniform sampler2D _Grass_texture;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Island_DefaultOBJ_Normal = i.uv_texcoord * _Island_DefaultOBJ_Normal_ST.xy + _Island_DefaultOBJ_Normal_ST.zw;
			o.Normal = UnpackNormal( tex2D( _Island_DefaultOBJ_Normal, uv_Island_DefaultOBJ_Normal ) );
			float2 temp_cast_0 = (_Tiling).xx;
			float2 uv_TexCoord7 = i.uv_texcoord * temp_cast_0;
			float4 lerpResult5 = lerp( tex2D( _Dirt_texture, uv_TexCoord7 ) , tex2D( _Grass_texture, uv_TexCoord7 ) , i.vertexColor.r);
			o.Albedo = lerpResult5.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18909
400;73;958;650;2164.064;280.3757;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;8;-1698.064,-83.3757;Inherit;False;Property;_Tiling;Tiling;3;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;7;-1488.72,-86.29553;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;4,4;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;-1180.071,87.76306;Inherit;True;Property;_Grass_texture;Grass_texture;2;0;Create;True;0;0;0;False;0;False;-1;2adc3e2d11f845d49b5d866ca5e49a04;2adc3e2d11f845d49b5d866ca5e49a04;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.VertexColorNode;6;-1103.261,315.9525;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;2;-1162.78,-163.455;Inherit;True;Property;_Dirt_texture;Dirt_texture;1;0;Create;True;0;0;0;False;0;False;-1;880d3c07d28e95a439b2029237ce0804;880d3c07d28e95a439b2029237ce0804;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1;-422.2902,126.2567;Inherit;True;Property;_Island_DefaultOBJ_Normal;Island_Default OBJ_Normal;0;0;Create;True;0;0;0;False;0;False;-1;2b3bed8724f8036499a5aebc370492d6;2b3bed8724f8036499a5aebc370492d6;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;5;-692.5214,-24.56154;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;Custom/IslandShader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;16;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;7;0;8;0
WireConnection;3;1;7;0
WireConnection;2;1;7;0
WireConnection;5;0;2;0
WireConnection;5;1;3;0
WireConnection;5;2;6;1
WireConnection;0;0;5;0
WireConnection;0;1;1;0
ASEEND*/
//CHKSM=82CB076D8CE83DBFC7717E34DEDEB8AA1F2663F5