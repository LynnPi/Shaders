Shader "Custom/MaskShader" {
	Properties {

		_MainTex ("Base (RGB)", 2D) = "white" {}
		_Mask( "Mask", 2D) = "white"{}
		_Cutoff("Cutoff", Range(0,1)) = 0.1
		
	}
	SubShader {
		Tags { "Queue"="Transparent" }
		Lighting Off
		ZWrite Off
		Blend SrcAlpha OneMinusSrcAlpha
		AlphaTest Gequal [_Cutoff]
		Pass{
			SetTexture[_Mask] {combine texture}
			SetTexture[_MainTex] {combine texture, texture-previous}
		}
	} 
}
