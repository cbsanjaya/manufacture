unit DataModels;

interface
uses
  SysUtils,
  Generics.Collections,
  Aurelius.Mapping.Attributes,
  Aurelius.Types.Blob,
  Aurelius.Types.DynamicProperties,
  Aurelius.Types.Nullable,
  Aurelius.Types.Proxy,
  Aurelius.Criteria.Dictionary;

type
  [Entity, AutoMapping]
  TProducts = class
  private
    FId: Integer;
    FDescription: string;
    FUnitName: string;
    FCostPrice: Double;
    FPrice: Double;
    FToSell: Boolean;
    FToBuy: Boolean;
    FIsRaw: Boolean;
  public
    property Id: Integer read FId write FId;
    property Description: string read FDescription write FDescription;
    property UnitName: string read FUnitName write FUnitName;
    property CostPrice: Double read FCostPrice write FCostPrice;
    property Price: Double read FPrice write FPrice;
    property ToSell: Boolean read FToSell write FToSell;
    property ToBuy: Boolean read FToBuy write FToBuy;
    property IsRaw: Boolean read FIsRaw write FIsRaw;
  end;

implementation

initialization
  RegisterEntity(TProducts);

end.
