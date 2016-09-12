package com.nike.wc.color;

import wt.fc.WTObject;
import wt.util.WTException;
import com.lcs.wc.color.LCSColor;
import com.lcs.wc.foundation.LCSLogic;

public class NikeColorPlugin {
	
	public static void ValidateRGBUniqueness(WTObject obj) throws WTException {
		
		if (obj instanceof LCSColor){

			LCSColor color = (LCSColor)obj;
			String hex=(String)color.getColorHexidecimalValue();
			color.setValue("nikeHexCode", hex);		
			LCSLogic.persist(color, true);
		}

	}
}
