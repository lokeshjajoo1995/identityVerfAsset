import { LightningElement, api } from "lwc";

const classTypeMap = {
  "error": "slds-box slds-box_x-small slds-theme_error",
  "success": "slds-box slds-box_x-small slds-theme_success",
  "general": "slds-box slds-box_x-small"
};
const iconTypeMap = {
    "error": "utility:close",
    "success":"utility:success",
    "general": "utility:announcement"

}

export default class MessageDisplayer extends LightningElement {
      messageclass;
 @api variant;
 @api message;
 iconclass;
    connectedCallback(){
    if(this.variant == null){
        this.variant = 'general';
    }
    this.messageclass = classTypeMap[this.variant];
    this.iconclass = iconTypeMap[this.variant];
    }
}