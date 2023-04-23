-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `top_clean_energy`
--

DROP TABLE IF EXISTS `top_clean_energy`;
/*!50001 DROP VIEW IF EXISTS `top_clean_energy`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `top_clean_energy` AS SELECT 
 1 AS `name`,
 1 AS `highest_clean_energy`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `top_dirty_energy`
--

DROP TABLE IF EXISTS `top_dirty_energy`;
/*!50001 DROP VIEW IF EXISTS `top_dirty_energy`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `top_dirty_energy` AS SELECT 
 1 AS `name`,
 1 AS `highest_dirty_energy`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `top_clean_energy`
--

/*!50001 DROP VIEW IF EXISTS `top_clean_energy`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_clean_energy` AS select `c`.`name` AS `name`,max(`e`.`clean_energy`) AS `highest_clean_energy` from (`countries` `c` join `energy` `e` on((`c`.`iso_code` = `e`.`iso_code`))) where (`e`.`year` between 1990 and 2019) group by `c`.`iso_code` having (`highest_clean_energy` = (select max(`energy`.`clean_energy`) from `energy` where ((`energy`.`year` between 1990 and 2019) and (`energy`.`iso_code` = `c`.`iso_code`)))) order by `highest_clean_energy` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_dirty_energy`
--

/*!50001 DROP VIEW IF EXISTS `top_dirty_energy`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_dirty_energy` AS select `c`.`name` AS `name`,max(`e`.`dirty_energy`) AS `highest_dirty_energy` from (`countries` `c` join `energy` `e` on((`c`.`iso_code` = `e`.`iso_code`))) where (`e`.`year` between 1990 and 2019) group by `c`.`iso_code` having (`highest_dirty_energy` = (select max(`energy`.`dirty_energy`) from `energy` where ((`energy`.`year` between 1990 and 2019) and (`energy`.`iso_code` = `c`.`iso_code`)))) order by `highest_dirty_energy` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-23 15:42:10
