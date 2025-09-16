package com.erpx.catalog.factory;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.CallableStatementCallback;
import org.springframework.jdbc.core.CallableStatementCreator;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.dme.catalog.exception.CatalogException;
import com.dme.catalog.factory.interfaces.ICatalogFactory;
import com.dme.catalog.to.CatalogDetailTO;
import com.dme.catalog.to.CatalogPKTO;
import com.dme.catalog.to.CatalogTO;
import com.dme.catalog.to.CatalogTypes;
import com.erpx.general.ERPConstants;

@Component
public class ERPCatalogFactory implements ICatalogFactory, ApplicationContextAware {
     
	@Autowired
	@Qualifier("datasource")
    private DataSource datasource = null;
    private ApplicationContext ctx = null;
    private Log log = LogFactory.getLog(ERPCatalogFactory.class);

     @Override
     public CatalogTO buildCatalog(CatalogPKTO pk) throws CatalogException {
          
          try {
               log.info("CARGANDO CATALOGO:" + pk.toString());
               JdbcTemplate catalogLoad = new JdbcTemplate(datasource);
               CatalogTO catalogData = catalogLoad.execute(new CallableStatementCreator() {

                    @Override
                    public CallableStatement createCallableStatement(Connection con) throws SQLException {
                         CallableStatement cstmt = con.prepareCall("{call sp_detalle_catalogo (?,?)}");
                         Object obj = pk.getReferencia("empresa");
                         if (obj != null && obj instanceof Integer) {
                             cstmt.setInt("@i_codigo_empresa", (Integer)obj);
                         }else {
                             cstmt.setNull("@i_codigo_empresa", Types.INTEGER); 
                         }
                         cstmt.setString("@i_nemonico", pk.getName());
                         return cstmt;
                    }

               }, new CallableStatementCallback<CatalogTO>() {

                    @Override
                    public CatalogTO doInCallableStatement(CallableStatement cs) throws SQLException, DataAccessException {
                         ResultSet rs = cs.executeQuery();
                         
                         if (rs.next()) {                                                                         
                              CatalogTO catalogo = new CatalogTO(new CatalogPKTO(rs.getString("nemonico"), ERPConstants.ERP_DOMAIN), rs.getString("nombre"));
                              catalogo.setCatalogCode(rs.getInt("correlativo"));
                              catalogo.setDescripcion(pk.getName());
                              catalogo.setCatalogType(CatalogTypes.DataBaseCatalog);
                              catalogo.setCatalogDomainType(rs.getString("tipo"));
                              
                              log.info("INFORMACION ENCONTRADA:" + catalogo.getCatalogCode() + "-" + catalogo.getCatalogType());
                              return catalogo;
                         }else {
                              throw new DataAccessException("CATALOGO :" + pk.toString() + " NO EXISTE") {};
                         }
                              
                         
                    }

               });

               List<CatalogDetailTO> catalogDetail = catalogLoad.execute(new CallableStatementCreator() {

                    @Override
                    public CallableStatement createCallableStatement(Connection con) throws SQLException {
                         CallableStatement cstmt= con.prepareCall("{call sp_listado_cat_dominios(?)}");
                         cstmt.setInt("@i_corr_catalogo", catalogData.getCatalogCode());
                         return cstmt;
                    }
                    
               }, new CallableStatementCallback<List<CatalogDetailTO>>() {

                    @Override
                    public List<CatalogDetailTO> doInCallableStatement(CallableStatement cs)
                              throws SQLException, DataAccessException {
                         ResultSet rs= cs.executeQuery();
                         List<CatalogDetailTO> l = new ArrayList<CatalogDetailTO>();
                         
                         while(rs.next()) {
                              CatalogDetailTO detalle = new CatalogDetailTO();
                              detalle.setDescription(rs.getString("nombre"));
                              detalle.setCatalogDetailCode(rs.getInt("correlativo"));
                              int numericValue= rs.getInt("valornumerico");
                              String stringValue= rs.getString("valoralfanumerico");                              
                              if (catalogData.getCatalogDomainType() != null) {
                                   if (catalogData.getCatalogDomainType().equals("N")) {
                                        detalle.setShortCode(Integer.toString(numericValue));
                                   }
                                   if (catalogData.getCatalogDomainType().equals("A")) {
                                        detalle.setShortCode(stringValue);
                                   }                                   
                              }
                              String nemonicoCataogoDerivado = rs.getString("nemonico");
                              if (nemonicoCataogoDerivado != null) {
                                   CatalogPKTO pkDerivado = new CatalogPKTO();
                                   pkDerivado.setDomain(ERPConstants.ERP_DOMAIN);
                                   pkDerivado.setName(nemonicoCataogoDerivado);
                                   Object obj = pk.getReferencia("empresa");
                                   pkDerivado.addReferencia("empresa", (obj != null ? (Integer)obj : null));                                   
                                   detalle.setDerivedCatalog(pkDerivado);
                              }
                              
                              if (detalle.getShortCode() == null) {
                                   throw new DataAccessException("CATALOGO (" + pk.toString() + ") NO DEFINE VALOR DE DOMINIO EN EL REGISTRO " + detalle.getCatalogDetailCode()) {};     
                              }   
                              log.info("DETALLE DE CATALOGO:" + detalle.getShortCode() + "-" + detalle.getDescription());
                              
                              l.add(detalle);
                         }
                         
                         return l;
                    }
               });
               
               if (catalogDetail == null || catalogDetail.size() == 0) {
                    throw new DataAccessException("CATALOGO :" + pk.toString() + " NO DEFINE DETALLE") {};
               }
               /*for (CatalogDetailTO catalogDetailTO : catalogDetail) {
                    catalogData.add(catalogDetailTO);
                    log.info("Cargando archivos asociados:");
                    CatalogDetailFileTO file = catalogLoad.execute(new PreparedStatementCreator() {
						
						@Override
						public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
							PreparedStatement pstmt = con.prepareStatement("select * from gecatalogodominioarchivo where corre_gecatalogo_dominio = ? and activo = 1");
							pstmt.setInt(1, catalogDetailTO.getCatalogDetailCode());
							return pstmt;
						}
					}
                    , new PreparedStatementCallback<CatalogDetailFileTO>() {

						@Override
						public CatalogDetailFileTO doInPreparedStatement(PreparedStatement ps) throws SQLException, DataAccessException {
							ResultSet rs = null;
							try {
								rs = ps.executeQuery();							
								if (rs.next()) {
									CatalogDetailFileTO file = new CatalogDetailFileTO();
					Constants.CATALOG_DOMAIN				file.setActive(true);
									file.setName(rs.getString("nombre"));
									file.setMime(rs.getString("mime"));
									file.setContentB64(ClobUtil.getClobStr("contenido", rs));
									file.setCorrelativo(rs.getInt("correlativo"));
									file.setControl(rs.getInt("control"));
									return file;
								}else {
									log.info("Catalogo no tiene asociado archivo.");
								}
								return null;
							}catch(Exception ex){
								log.error("Error al obtener info del archivo:", ex);
								throw new DataAccessException("Error al mapear archivo", ex) {};
							}finally {
								rs.close();
							}
						}
                    	
					});
                    if (file != null) {
                    	log.info("Asociando archivo:" + file.getName());
                    	catalogDetailTO.setCatalogFile(file);
                    }
               }*/

               return catalogData;
          }catch(DataAccessException ex) {
               throw new CatalogException(pk, ex);
          }
     }


     public DataSource getDatasource() {
          return datasource;
     }

     public void setDatasource(DataSource datasource) {
          this.datasource = datasource;
     }

     @Override
     public void setApplicationContext(ApplicationContext ctx) throws BeansException {
          this.ctx = ctx;
     }


	 @Override
	 public void updateCatalog(CatalogTO catalog) throws CatalogException {
		// TODO Auto-generated method stub
		
	 }


	 @Override
	 public void createCatalog(CatalogTO catalog) throws CatalogException {
		// TODO Auto-generated method stub
		
	 }


	 @Override
	 public void deleteCatalog(CatalogTO catalog) throws CatalogException {
		// TODO Auto-generated method stub
		
	 }


	 @Override
	 public void updateCatalogDetail(CatalogDetailTO detail) throws CatalogException {
		// TODO Auto-generated method stub
		
	 }


	 @Override
	 public void createCatalogDetail(CatalogDetailTO detail) throws CatalogException {
		// TODO Auto-generated method stub
		
	 }


	 @Override
	 public void deleteCatalogDetail(CatalogDetailTO detail) throws CatalogException {
		// TODO Auto-generated method stub
		
	 }

}
