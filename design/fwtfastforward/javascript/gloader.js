/**
 * Supplying multiple Google API Keys for domain names
 *
 * @author Olav Frengstad <olav@fwt.no>
 */

function getKeyForDomain( domain )
{
    var domains = {
        'www.tiny-mesh.no'          : 'ABQIAAAA-8tMluRY3coQkqzcBCGcXxTkCx0IFz3taNr9qIF4yzwUFuXsIxQ5nNuKadV0DxJ2vOJ7G6fI_HQC3w',
        'www.tiny-mesh.com'         : 'ABQIAAAA-8tMluRY3coQkqzcBCGcXxRaxE4eJz_cOaBdZ5pUsGndWkx1hhR4rhscB3D7haMFIvRctaGEdOpD2g',
        'tiny-mesh.no'              : 'ABQIAAAA-8tMluRY3coQkqzcBCGcXxTV3dCkiXB-q5a5GqwZvq7GIQb29BSKCo9zvHRYiCHJ8G9AUuVjdP_I3w',
        'tiny-mesh.com'             : 'ABQIAAAA-8tMluRY3coQkqzcBCGcXxT2nNa-CogiHZ8FfVYqsjtClRsDPBTLSnThZmnsSfKaGo9hO4MAuA9_7Q',
        'www.admin.tiny-mesh.no'    : 'ABQIAAAA-8tMluRY3coQkqzcBCGcXxTbLgnNYYzzcvpz7RDdv3FDrw1PjhSsJ0CDUbm61EDMSAAO1Ce-EEl00w',
        'www.admin.tiny-mesh.com'   : 'ABQIAAAA-8tMluRY3coQkqzcBCGcXxShrX_TZNuDLa2cAYZphCKu2X3W6RTlk2txPlcLza-IfWFxes3XBJ51Jw',
        'admin.tiny-mesh.no'        : 'ABQIAAAA-8tMluRY3coQkqzcBCGcXxTkhYFv8DG3wVOmvaTTNw0-FnEhGRS2DEmjeEfyLxaDxk0Qv4VWpZ9kHg',
        'admin.tiny-mesh.com'       : 'ABQIAAAA-8tMluRY3coQkqzcBCGcXxTmk3gUKQTNOe0AhfpnfewoGqbXbRThYDu2PTZG2zivF7Ed-FkF5uuv6Q'
    };
    
    return domains[domain];
}

function initLoader() {
    var script  = document.createElement('script');
    script.src  = 'https://www.google.com/jsapi?key=' + getKeyForDomain( document.domain );
    script.type = 'text/javascript';
    
    document.getElementsByTagName("head")[0].appendChild(script);
}

initLoader();