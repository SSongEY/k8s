package com.example.helthcheck

import org.slf4j.LoggerFactory
import org.springframework.http.HttpStatusCode
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController

@RestController
class HealthCheckController {

    private val logger = LoggerFactory.getLogger("HEALTH-CHECK")

    @GetMapping("/healthCheck")
    fun healthCheck(
        @RequestParam(required = false, defaultValue = "200") status: Int
    ): ResponseEntity<String> {
        logger.info("healthCheck")

        val statusCode = runCatching {
            HttpStatusCode.valueOf(status)
        }.getOrElse {
            return ResponseEntity.badRequest().body("invalid status code")
        }

        return ResponseEntity("success", statusCode)
    }
}
